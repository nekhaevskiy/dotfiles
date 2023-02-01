#!/bin/bash

########
# nvim #
########

# mkdir -p "$HOME/.config/nvim"
# mkdir -p "$HOME/.config/nvim/undo"

# ln -sf "$HOME/dotfiles/nvim/init.vim" "$HOME/.config/nvim"

#######
# X11 #
#######

rm -rf "$HOME/.config/X11"
ln -s "$HOME/dotfiles/X11" "$HOME/.config"

######
# i3 #
######

rm -rf "$HOME/.config/i3"
ln -s "$HOME/dotfiles/i3" "$HOME/.config"

#######
# zsh #
#######

rm "$HOME/.zshenv"
rm -rf "$HOME/.config/zsh"
mkdir -p "$HOME/.config/zsh"
ln -sf "$HOME/dotfiles/zsh/.zshenv" "$HOME"
ln -sf "$HOME/dotfiles/zsh/.zshrc" "$HOME/.config/zsh"
ln -sf "$HOME/dotfiles/zsh/aliases" "$HOME/.config/zsh"
ln -sf "$HOME/dotfiles/zsh/external" "$HOME/.config/zsh"

#########
# fonts #
#########

mkdir -p "$XDG_DATA_HOME"
cp -rf "$DOTFILES/fonts" "$XDG_DATA_HOME"

#############
# alacritty #
#############

rm -rf "$HOME/.config/alacritty"
ln -s "$HOME/dotfiles/alacritty" "$HOME/.config"

###########
# zathura #
###########

rm -rf "$HOME/.config/zathura"
ln -s "$HOME/dotfiles/zathura" "$HOME/.config"
