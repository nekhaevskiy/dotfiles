#!/bin/bash

rm -rf "$XDG_CONFIG_HOME/nvim"

mkdir -p "$XDG_CONFIG_HOME/nvim"
#mkdir -p "$XDG_CONFIG_HOME/nvim/undo"

ln -sf "$DOTFILES/nvim/init.lua" "$XDG_CONFIG_HOME/nvim"
ln -s "$DOTFILES/nvim/lua" "$XDG_CONFIG_HOME/nvim"
#ln -sf "$DOTFILES/nvim/coc-settings.json" "$XDG_CONFIG_HOME/nvim/coc-settings.json"

# install neovim plugin manager
#[ ! -f "$XDG_CONFIG_HOME/nvim/autoload/plug.vim" ] && curl -fLo "$XDG_CONFIG_HOME/nvim/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#mkdir -p "$XDG_CONFIG_HOME/nvim/autoload"
#ln -sf "$DOTFILES/nvim/autoload/plug.vim" "$XDG_CONFIG_HOME/nvim/autoload/plug.vim"

# install (or update) all the plugins
#nvim --noplugin +PlugUpdate +qa
