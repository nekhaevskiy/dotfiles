# external utils
fpath=($ZDOTDIR/external $fpath)

# aliases
source "$XDG_CONFIG_HOME/zsh/aliases"

# Vim mapping for completion
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# Completion system
autoload -U compinit; compinit

# Autocomplete hidden files
_comp_options+=(globdots)
source "$XDG_CONFIG_HOME/zsh/external/completion.zsh"

# Prompt
autoload -Uz prompt_purification_setup; prompt_purification_setup

# Push the current directory visited on to the stack
setopt AUTO_PUSHD
# Do not store duplicate directories in the stack
setopt PUSHD_IGNORE_DUPS
# Do not print the directory stack after using pushd or popd
setopt PUSHD_SILENT

# Vi mode
bindkey -v
export KEYTIMEOUT=1

# Changing cursor
autoload -Uz cursor_mode && cursor_mode

# Editing commands in Neovim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Jumping to a parent directory
source ~/dotfiles/zsh/external/bd.zsh

# The fuzzy finder fzf
if [ $(command -v "fzf") ]; then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
fi

# Automatically starting i3
if [ "$(tty)" = "/dev/tty1" ]; then
    pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi

# NVM
source /usr/share/nvm/init-nvm.sh

# Custom scripts
source ~/dotfiles/zsh/scripts.sh

# Clearing the shell is now done with CTRL+g
bindkey -r '^l'
bindkey -r '^g'
bindkey -s '^g' 'clear\n'

# nvm
source /usr/share/nvm/init-nvm.sh

# Syntax Highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

