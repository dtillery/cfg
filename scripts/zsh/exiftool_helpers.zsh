function exiftool_migrate_gps_data {
    # usage: exiftool_migrate_gps_data false 3
    # Function to find all ARW/DNG files in a directory without GPS tags and attempt to
    # tag them with the closest file's tags within a time-range.
    # requires: exiftool, gdate
    green=$'\e[1;32m'
    red=$'\e[1;31m'
    white=$'\e[0m'
    blue=$'\e[1;34m'
    datetime_format='%Y-%m-%d %H:%M:%S %Z'
    fixed=()
    unfixed=()

    commit=$1
    buffer_minutes=$2
    if [[ -z $buffer_minutes ]]; then
        buffer_minutes='2'
    fi

    # get every filename with missing GPS data
    echo $blue"==== Starting with COMMIT=$commit and BUFFER=$buffer_minutes ===="$white
    echo "Searching for files without GPS tags..."
    missing_gps_filenames=($(exiftool -q -fileorder name -if 'not ($GPSLatitude and $GPSLongitude)' -json -ext arw -ext rw2 -ext jpg -ext dng . | jq -r 'map(.SourceFile) | join(" ")'))
    found_count=${#missing_gps_filenames[@]}
    echo $blue"==== Found $found_count files without GPSLatitude and GPSLongitude tags"$white

    curr=0
    for filename in $missing_gps_filenames; do
        let curr++
        # get original datetime for file
        datetime_original=$(exiftool -d $datetime_format -q -s3 -datetimeoriginal $filename)
        echo $blue"==== ($curr/$found_count) $filename ($datetime_original) is missing GPS coordinates. ===="$white

        # for each file, create buffer datetimes and find candidates with creation date within range
        datetime_lower=$(gdate -d "$datetime_original -$buffer_minutes minutes" "+$datetime_format")
        datetime_upper=$(gdate -d "$datetime_original +$buffer_minutes minutes" "+$datetime_format")
        echo "Searching for candidates between $datetime_lower and $datetime_upper (buffer=$buffer_minutes min.)"
        candidates=$(exiftool -q -json -d $datetime_format \
            -if '$GPSLatitude and $GPSLongitude' \
            -if "\$DateTimeOriginal ge '$datetime_lower'" \
            -if "\$DateTimeOriginal le '$datetime_upper'" \
            -ext arw -ext rw2 -ext dng -ext heic -ext jpeg -ext jpg .)

        # continue if no candidates found
        if [[ -z $candidates ]]; then
            echo $red"ZERO candidates found within buffer, skipping..."$white
            unfixed+=("$filename")
            continue
        fi
        echo "$(jq 'length' <<< $candidates) candidates found."

        # for each candidate pull original datetime and determine which is closest to file.
        closest_filename=''
        closest_time=''
        closest_diff=''
        for candidate in $(jq -r 'map(.SourceFile) | join(" ")' <<< $candidates); do
            candidate_time=$(exiftool -s3 -d $datetime_format -datetimeoriginal $candidate)
            ((diff = $(gdate -d "$datetime_original" "+%s") - $(gdate -d "$candidate_time" "+%s")))
            if [[ "$diff" -lt 0 ]]; then ((diff = diff * -1 )); fi

            if [[ -z "$closest_diff" ]] || [[ "$diff" -lt "$closest_diff" ]]; then
                closest_diff=$diff
                closest_time=$candidate_time
                closest_filename=$candidate
            fi
        done
        echo "Closest candidate is ${green}$closest_filename${white} at $closest_time (${green}$closest_diff sec diff${white})"

        # Copy tags from candidate to file if commit flag is passed
        if [[ "$commit" == "commit" ]]; then
            echo "Copying GPS tags from $closest_filename to $filename"
            mkdir -p originals fixed
            exiftool -tagsfromfile $closest_filename -gps:all -wm wcg $filename
            cp $filename fixed/
            mv ${filename}_original originals/
            fixed+=("$filename")
            touch gps_fix_log.txt
        else
            echo "DRY RUN not committing changes"
            fixed+=("$filename")
        fi
    done

    echo $blue"==== Work Complete ===="$white
    echo $blue"Missing GPS: ${#missing_gps_filenames[@]}"$white
    echo $green"Fixed (if committed): ${#fixed[@]} files ($fixed)"$white
    echo $red"Unfixed: ${#unfixed[@]} ($unfixed)"$white
}

function exiftool_copy_gps_data {
    # copy all gps related tags from a source file to a destination file(s)
    # usage: exiftool_copy_gps_data -s source.arw -d destination.arw -o "true"

    while getopts ":s:d:f:o:" opt; do
        case $opt in
            s) src="$OPTARG";;
            d) dest="$OPTARG";;
            o) save_original="$OPTARG";;
            \?) echo "Invalid option: -$OPTARG";;
        esac
    done

    if [[ ! -z $save_original ]]; then
        echo "Saving originals in /originals_bad_time"
        save_original_arg="&& mkdir -p originals_no_gps && mv *_original originals_no_gps"
    fi

    cmd="exiftool -if 'not (\$GPSLatitude and \$GPSLongitude)' -tagsfromfile $src -gps:all -wm wcg $dest $save_original_arg"
    echo "Running cmd: $cmd"
    eval $cmd
}


# exiftool -fileorder name -if '$OffsetTime ne "-03:00"' -alldates+=1 -offsettime="-03:00" -offsettimeoriginal="-03:00" -offsettimedigitized="-03:00" -ext arw . && mkdir -p originals_bad_time && mv *_original originals_bad_time
function exiftool_shift_datetime {
    # usage: exiftool_shift_datetime -f "-05:00" -d "-=1" -z "-05:00" -o "true"
    # find all pictures with diff offset time and set correctly and add time to all datefields
    # -f: filter based on timezone not matching the input
    # -d: hours to offset datetimes, in the form of +=hour or -=hour
    # -z: new timezone to set to, probably same as filter
    # -o: save original file
    filter=""
    alldates_offset=""
    new_timezone=""
    save_original=""

    while getopts ":f:d:z:o:" opt; do
        case $opt in
            f) filter="$OPTARG";;
            d) alldates_offset="$OPTARG";;
            z) new_timezone="$OPTARG";;
            o) save_original="$OPTARG";;
            \?) echo "Invalid option: -$OPTARG";;
        esac
    done

    if [[ ! -z $filter ]]; then
        echo "Filtering by OffsetTime not equal to $filter or OffsetTime is not set"
        filter_arg="-if 'not \$OffsetTime or \$OffsetTime ne \"$filter\"'"
    fi

    if [[ ! -z $alldates_offset ]]; then
        echo "Setting alldates to $alldates_offset"
        alldates_offset_arg="-alldates$alldates_offset"
    fi

    if [[ ! -z $new_timezone ]]; then
        echo "Setting new timezone to $new_timezone"
        new_timezone_arg="-offsettime=\"$new_timezone\" -offsettimeoriginal=\"$new_timezone\" -offsettimedigitized=\"$new_timezone\""
    fi

    if [[ ! -z $save_original ]]; then
        echo "Saving originals in /originals_bad_time"
        save_original_arg="&& mkdir -p originals_bad_time && mv *_original originals_bad_time"
    fi

    cmd="exiftool -fileorder name -ext arw -ext rw2 -ext dng -ext heic -ext jpeg -ext jpg $filter_arg $alldates_offset_arg $new_timezone_arg . $save_original_arg"
    echo "Running cmd: $cmd"
    eval "$cmd"
}


function exiftool_print_dates {
    # usage: exiftool_print_dates ../photo.arw
    # print the date fields I want
    file=$1
    echo $file
    if [[ -z $file ]]; then
        file="."
    fi
    cmd="exiftool -fileorder name -s -alldates -offsettime $file"
    eval "$cmd"
}

function exiftool_print_gps {
    # usage: exiftool_print_gps ../photo.arw
    # print the gps fields I want
    file=$1
    echo $file
    if [[ -z $file ]]; then
        file="."
    fi
    cmd="exiftool -fileorder name -s -gpslatitude -gpslongitude -gps:all  $file"
    eval "$cmd"
}
