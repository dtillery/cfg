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
