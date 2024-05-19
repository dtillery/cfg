function delete_file_not_in_list {
    listfile=$1

    for f in *; do
        if ! grep -qxFe "$f" $listfile; then
        echo "Deleting: $f"
        rm "$f"
    else
        echo "Keeping: $f"
    fi
    done
}

function pyver {
    echo $1 > .python-version
}

function btail {
    tail -f $1 | bat --paging=never -l log
}

function m4a_to_ogg {
    ffmpeg -i $1 -acodec libvorbis -aq 4 -vn -ac 2 -map_metadata 0 $2
}