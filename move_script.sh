
user=$(whoami)
text_file=$(echo "/home/${user}/.dotfiles/files_to_track.txt")

link_it_baby() {
    while read p; do
        source=$(echo "$p" | cut -d '|' -f1)
        destination=$(echo "$p" | cut -d '|' -f2)
        ln -sfFv "$source" "$destination"
        # echo ln -sfiv "$source" "$destination"
        echo "---------------------------------"
    done <"$text_file"

}

link_it_baby
