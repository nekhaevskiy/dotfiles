#!/bin/bash

#################
# env variables #
#################

export XDG_CONFIG_HOME=$HOME/.config
export DOTFILES=$HOME/dotfiles

###########
# espanso #
###########

rm -rf "$XDG_CONFIG_HOME/espanso/match/base.yml"
ln -sf "$DOTFILES/espanso/match/base.yml" "$XDG_CONFIG_HOME/espanso/match"

#######
# git #
#######

rm -rf "$XDG_CONFIG_HOME/git"
ln -s "$DOTFILES/git" "$XDG_CONFIG_HOME"

###########
# lazygit #
###########

rm -rf "$XDG_CONFIG_HOME/lazygit"
mkdir -p "$XDG_CONFIG_HOME/lazygit"
ln -sf "$DOTFILES/lazygit/config.yml" "$XDG_CONFIG_HOME/lazygit"

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
# zsh #
#######

rm -f "$HOME/.zshenv"
rm -rf "$XDG_CONFIG_HOME/zsh"
mkdir -p "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/.zshenv" "$HOME"
ln -sf "$DOTFILES/zsh/.zshrc" "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/aliases" "$XDG_CONFIG_HOME/zsh"
ln -s "$DOTFILES/zsh/external" "$XDG_CONFIG_HOME/zsh"
