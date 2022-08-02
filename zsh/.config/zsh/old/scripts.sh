#!/bin/zsh

# compress a directory
compress() {
    tar cvzf $1.tar.gz $1
}

# open man page in vim
vman() {
    nvim -c "SuperMan $*"

    if [ "$?" != "0" ]; then
        echo "No manual entry for $*"
    fi
}
