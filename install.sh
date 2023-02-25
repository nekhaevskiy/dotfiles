#!/bin/bash

#############
# alacritty #
#############

rm -rf "$XDG_CONFIG_HOME/alacritty"
ln -s "$DOTFILES/alacritty" "$XDG_CONFIG_HOME"

#########
# dunst #
#########

rm -rf "$XDG_CONFIG_HOME/dunst"
ln -s "$DOTFILES/dunst" "$XDG_CONFIG_HOME"

#########
# fonts #
#########

mkdir -p "$XDG_DATA_HOME"
cp -rf "$DOTFILES/fonts" "$XDG_DATA_HOME"

#######
# git #
#######

rm -rf "$XDG_CONFIG_HOME/git"
ln -s "$DOTFILES/git" "$XDG_CONFIG_HOME"

######
# i3 #
######

rm -rf "$XDG_CONFIG_HOME/i3"
ln -s "$DOTFILES/i3" "$XDG_CONFIG_HOME"

########
# nvim #
########

rm -rf "$XDG_CONFIG_HOME/nvim"
ln -s "$DOTFILES/nvim" "$XDG_CONFIG_HOME"

########
# tmux #
########

rm -rf "$XDG_CONFIG_HOME/tmux"
mkdir -p "$XDG_CONFIG_HOME/tmux"
ln -sf "$DOTFILES/tmux/tmux.conf" "$XDG_CONFIG_HOME/tmux"

#######
# X11 #
#######

rm -rf "$XDG_CONFIG_HOME/X11"
ln -s "$DOTFILES/X11" "$XDG_CONFIG_HOME"

###########
# zathura #
###########

rm -rf "$XDG_CONFIG_HOME/zathura"
ln -s "$DOTFILES/zathura" "$XDG_CONFIG_HOME"

#######
# zsh #
#######

rm "$HOME/.zshenv"
rm -rf "$XDG_CONFIG_HOME/zsh"
mkdir -p "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/.zshenv" "$HOME"
ln -sf "$DOTFILES/zsh/.zshrc" "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/aliases" "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/external" "$XDG_CONFIG_HOME/zsh"
