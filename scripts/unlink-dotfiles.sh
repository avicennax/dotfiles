#!/bin/bash

# unlink-dotfiles.sh
# Description: removes all symlinked dotfiles from user's
#   home directory.

printf "Running $0\n\n"
set -u

dotfiles_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/.. >/dev/null && pwd )"

for dotfile in $(find $dotfiles_dir -maxdepth 1 -not -type d); do
    if [[ ${dotfile##*/} != 'README.md' ]]; then
        if [ -L ~/.${dotfile##*/} ]; then
            rm  ~/.${dotfile##*/}
            printf "~/.${dotfile##*/} successfully removed.\n"
        elif [ -e ~/.${dotfile##*/} ]; then
            printf "~/.${dotfile##*/} is not a symlink.\n"
        else
            printf "~/.${dotfile##*/} does not exist.\n"
        fi
    fi
done

printf "\nExiting.\n\n"
