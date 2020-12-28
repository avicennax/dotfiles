#!/bin/bash

# link_dotvim.sh
# Description: symlinks .vim filetype and syntax scripts

printf "Running $0\n\n"
set -u

vim_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/.. >/dev/null && pwd )"
mkdir -p ${vim_dir}

if [[ -d $HOME/.vim ]]; then
    for directory in $(ls ${vim_dir}/vim); do
        if [[ ! -e $HOME/.vim/${directory} ]]; then
            printf "~/.vim/${directory} successfully linked.\n"
            ln -s ${vim_dir}/vim/${directory} $HOME/.vim/${directory}
        else
            printf "~/.vim/${directory} already exists; linked not created.\n"
        fi
    done
else
    printf "~/.vim either does not exist or is not a directory. "
fi

printf "\nExiting.\n\n"
