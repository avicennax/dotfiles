#!/bin/bash

# install.sh
# Description: boostraps environment - currently OSX only.

set -u


if [[ "$OSTYPE" == "darwin"* ]]; then
    # Install Homebrew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    # TODO: ensure we're at in $dotfiles and tap Brewfile.

    # TODO: symlink dotfiles

    # TODO: download and install powerline and powerline fonts

    # Install Miniconda
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O $HOME/Downloads/miniconda.sh
    bash $HOME/Downloads/miniconda.sh -b -p $HOME/miniconda
    export PATH="$HOME/miniconda/bin:$PATH"

    # TODO: pip install Vim environment dependencies.
fi
