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

    # Symlink dotfiles
    scripts/link-dotfiles.sh
    scripts/link-dotvim.sh

    # Download and install Powerline fonts; use Powerline font in iTerm profile.
    git clone https://github.com/powerline/fonts.git ../powerline/fonts
    ../powerline/fonts/install.sh

    # Install fzf shell bindings.
    $(brew --prefix)/opt/fzf/install

    # Install Miniconda
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O $HOME/Downloads/miniconda.sh
    bash $HOME/Downloads/miniconda.sh -b -p $HOME/miniconda3
    export PATH="$HOME/miniconda3/bin:$PATH"
fi
