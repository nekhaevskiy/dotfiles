#!/bin/bash

########
# nvim #
########

mkdir -p "$XDG_CONFIG_HOME/nvim"
mkdir -p "$XDG_CONFIG_HOME/nvim/undo"

ln -sf "$DOTFILES/nvim/init.vim" "$XDG_CONFIG_HOME/nvim/init.vim"
ln -sf "$DOTFILES/nvim/coc-settings.json" "$XDG_CONFIG_HOME/nvim/coc-settings.json"

# install neovim plugin manager
[ ! -f "$XDG_CONFIG_HOME/nvim/autoload/plug.vim" ] \
    && curl -fLo "$XDG_CONFIG_HOME/nvim/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install (or update) all the plugins
nvim --noplugin +PlugUpdate +qa
