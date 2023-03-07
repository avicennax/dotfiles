#!/bin/bash

# init-nvim.sh
# Description: initializes Neovim setup

printf "Running $0\n\n"
set -u

# Get config files 
nvim_src_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/../config/nvim >/dev/null && pwd )"

# Create Neovim config directory in $HOME.
config_dir=".config/nvim"
nvim_lua_dir="$config_dir/lua"
nvim_plugin_dir="$config_dir/after/plugin"
nvim_ftdetect_dir="$config_dir/ftdetect"

mkdir -p $HOME/$nvim_lua_dir
mkdir -p $HOME/$nvim_plugin_dir
mkdir -p $HOME/$nvim_ftdetect_dir

# Link init.lua
ln -s $nvim_src_dir/init.lua $HOME/.config/nvim/init.lua

# Link Lua plugin files
for config_file in $(find $nvim_src_dir/lua -maxdepth 1 -not -type d); do
    ln -s $config_file ~/${nvim_lua_dir}/${config_file##*/} && printf "${config_file##*/} successfully linked to: ~/${nvim_lua_dir}/${config_file##*/}\n"
done
for config_file in $(find $nvim_src_dir/after/plugin -maxdepth 1 -not -type d); do
    ln -s $config_file ~/${nvim_plugin_dir}/${config_file##*/} && printf "${config_file##*/} successfully linked to: ~/${nvim_plugin_dir}/${config_file##*/}\n"
done
for config_file in $(find $nvim_src_dir/ftdetect -maxdepth 1 -not -type d); do
    ln -s $config_file ~/${nvim_ftdetect_dir}/${config_file##*/} && printf "${config_file##*/} successfully linked to: ~/${nvim_ftdetect_dir}/${config_file##*/}\n"
done
printf "\n\n"

ONLY_LINK=false

# Check Arguments for --only-link flag
while [[ $# -gt 0 ]]; do
    case "$1" in
        --only-link)
            ONLY_LINK=true
            shift
            ;;
        *)
            # Skip all other arguments
            shift
            ;;
    esac
done

if [ "$ONLY_LINK" = true ]; then
    printf "\nExiting.\n\n"
    exit 0
fi

# Download Github Copilot plugin for Neovim
copilot_dir="$HOME/.config/nvim/pack/github/start/copilot.vim"
rm -rf $copilot_dir
git clone https://github.com/github/copilot.vim $copilot_dir

# Download Packer
packer_dir="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
rm -rf $packer_dir
git clone --depth 1 https://github.com/wbthomason/packer.nvim $packer_dir

printf "\nExiting.\n\n"


