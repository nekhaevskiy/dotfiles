#!/bin/bash

########
# nvim #
########

mkdir -p "$XDG_CONFIG_HOME/nvim"
mkdir -p "$XDG_CONFIG_HOME/nvim/undo"

ln -sf "$DOTFILES/nvim/init.vim" "$XDG_CONFIG_HOME/nvim/init.vim"

rm -rf "$XDG_CONFIG_HOME/X11"
ln -s "$DOTFILES/X11" "$XDG_CONFIG_HOME/X11"

# install neovim plugin manager
[ ! -f "$XDG_CONFIG_HOME/nvim/autoload/plug.vim" ] \
    && curl -fLo "$XDG_CONFIG_HOME/nvim/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#mkdir -p "$XDG_CONFIG_HOME/nvim/autoload"
#ln -sf "$DOTFILES/nvim/autoload/plug.vim" "$XDG_CONFIG_HOME/nvim/autoload/plug.vim"

# Install (or update) all the plugins
nvim --noplugin +PlugUpdate +qa

######
# i3 #
######

rm -rf "$XDG_CONFIG_HOME/i3"
ln -s "$DOTFILES/i3" "$XDG_CONFIG_HOME/i3"

#######
# Zsh #
#######

mkdir -p "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/.zshenv" "$HOME/.zshenv"
ln -sf "$DOTFILES/zsh/.zshrc" "$XDG_CONFIG_HOME/zsh/.zshrc"
ln -sf "$DOTFILES/zsh/aliases" "$XDG_CONFIG_HOME/zsh/aliases"
rm -rf "$XDG_CONFIG_HOME/zsh/external"
ln -s "$DOTFILES/zsh/external" "$XDG_CONFIG_HOME/zsh/external"

#########
# Fonts #
#########

mkdir -p "$XDG_DATA_HOME"
cp -rf "$DOTFILES/fonts" "$XDG_DATA_HOME/fonts"

#########
# dunst #
#########

mkdir -p "$XDG_CONFIG_HOME/dunst"
ln -sf "$DOTFILES/dunst/dunstrc" "$XDG_CONFIG_HOME/dunst/dunstrc"

#######
# git #
#######

mkdir -p "$XDG_CONFIG_HOME/git"
ln -sf "$DOTFILES/git/config" "$XDG_CONFIG_HOME/git/config"

###############
# qutebrowser #
###############

mkdir -p "$XDG_CONFIG_HOME/qutebrowser"
ln -sf "$DOTFILES/qutebrowser/autoconfig.yml" "$XDG_CONFIG_HOME/qutebrowser"
ln -sf "$DOTFILES/qutebrowser/quickmarks" "$XDG_CONFIG_HOME/qutebrowser"
rm -rf "$XDG_CONFIG_HOME/qutebrowser/bookmarks"
ln -s "$DOTFILES/qutebrowser/bookmarks" "$XDG_CONFIG_HOME/qutebrowser"

########
# tmux #
########

mkdir -p "$XDG_CONFIG_HOME/tmux"
ln -sf "$DOTFILES/tmux/tmux.conf" "$XDG_CONFIG_HOME/tmux/tmux.conf"

[ ! -d "$XDG_CONFIG_HOME/tmux/plugins" ] \
&& git clone https://github.com/tmux-plugins/tpm \
"$XDG_CONFIG_HOME/tmux/plugins/tpm"

###########
# zathura #
###########

mkdir -p "$XDG_CONFIG_HOME/zathura"
ln -sf "$DOTFILES/zathura/zathurarc" "$XDG_CONFIG_HOME/zathura/zathurarc"
