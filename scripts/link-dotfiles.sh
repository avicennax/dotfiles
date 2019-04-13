#!/bin/bash

# link-dotfiles.sh
# Description: creates symbolic links in user's home
#   directory to dotfiles; script is assumed to be
#   in a child directory of the dotfiles parent directory.

printf "Running $0\n\n"
set -u

dotfiles_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/../dotfiles >/dev/null && pwd )"

for dotfile in $(find $dotfiles_dir -maxdepth 1 -not -type d); do
    ln -s $dotfile ~/.${dotfile##*/} && printf "${dotfile##*/} successfully linked to: ~/.${dotfile##*/}\n"
done

printf "\nExiting.\n\n"
