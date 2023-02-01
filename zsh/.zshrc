# load external plugins
fpath=($ZDOTDIR/external $fpath)

# aliases
source "$XDG_CONFIG_HOME/zsh/aliases"

# vim mapping for completion
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# completion
autoload -Uz compinit; compinit

# autocomplete hidden files
_comp_options+=(globdots) # With hidden files
source "$DOTFILES/zsh/external/completion.zsh"

# prompt
autoload -Uz prompt_purification_setup; prompt_purification_setup

# zsh directory stack
# push the current directory visited on to the stack
setopt AUTO_PUSHD
# do not store duplicate directories in the stack
setopt PUSHD_IGNORE_DUPS
# do not print the directory stack after using
setopt PUSHD_SILENT

# enable vi mode
bindkey -v
export KEYTIMEOUT=1

# change cursor
autoload -Uz cursor_mode && cursor_mode

# edit commands in neovim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# jump to a parent directory
source "$HOME/dotfiles/zsh/external/bd.zsh"

# fzf
if [ $(command -v "fzf") ]; then
    source "/usr/share/fzf/completion.zsh"
    source "/usr/share/fzf/key-bindings.zsh"
fi

# automatically starting i3
if [ "$(tty)" = "/dev/tty1" ];
then
    pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi

# custom scripts
source "$DOTFILES/zsh/scripts.sh"

# nvm
source "/usr/share/nvm/init-nvm.sh"

# tmux
export DISABLE_AUTO_TITLE='true'

# zoxide
eval "$(zoxide init zsh)"

# zsh syntax highlighting
source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
