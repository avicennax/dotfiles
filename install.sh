#!/bin/bash

# install.sh
# Description: boostraps Nix environment - currently OSX only.

set -u -o pipefail
cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null

if [[ "$OSTYPE" == "darwin"* ]]; then
    # Install Homebrew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew tap Homebrew/bundle
    brew bundle

    # Install Arkade
    # https://github.com/alexellis/arkade#install-a-cli-tool
    curl -sLS https://get.arkade.dev | sudo sh

    # Symlink dotfiles
    scripts/link-dotfiles.sh
    scripts/link-dotvim.sh

    # TODO: download and install powerline and powerline fonts

    # Install fzf shell bindings.
    $(brew --prefix)/opt/fzf/install

    # Install Miniconda
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O $HOME/Downloads/miniconda.sh
    bash $HOME/Downloads/miniconda.sh -b -p $HOME/miniconda
    export PATH="$HOME/miniconda/bin:$PATH"

    # TODO: pip install Vim environment dependencies.
fi
