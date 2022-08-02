# external utils
fpath=($ZDOTDIR/external $fpath)

# zsh sessions will append their history list to the history file, rather than replace it
setopt APPEND_HISTORY

# aliases
source "$ZDOTDIR/aliases"

# vim mapping for completion
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# completion system
autoload -U compinit; compinit

# autocomplete hidden files
_comp_options+=(globdots)
source "$ZDOTDIR/external/completion.zsh"

# autocomplete vman
compdef vman="man"

# prompt
autoload -Uz prompt_purification_setup; prompt_purification_setup

# push the current directory visited on to the stack
setopt AUTO_PUSHD
# do not store duplicate directories in the stack
setopt PUSHD_IGNORE_DUPS
# do not print the directory stack after using pushd or popd
setopt PUSHD_SILENT

# vi mode
bindkey -v
export KEYTIMEOUT=1

# changing cursor
autoload -Uz cursor_mode && cursor_mode

# editing commands in Neovim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# jumping to a parent directory
source "$ZDOTDIR/external/bd.zsh"

# the fuzzy finder fzf
if [ $(command -v "fzf") ]; then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
fi

# automatically starting i3
if [ "$(tty)" = "/dev/tty1" ]; then
    pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi

# custom scripts
source "$ZDOTDIR/scripts.sh"

# clearing the shell is now done with Ctrl+g
bindkey -r '^l'
bindkey -r '^g'
bindkey -s '^g' 'clear\n'

# nvm
source /usr/share/nvm/init-nvm.sh

# syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

