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
source "$DOTFILES/zsh/external/bd.zsh"

# fzf
if [ $(command -v "fzf") ]; then
    source "/usr/share/doc/fzf/examples/completion.zsh"
    source "/usr/share/doc/fzf/examples/key-bindings.zsh"
fi

# custom scripts
source "$DOTFILES/zsh/scripts.sh"

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# tmux
export DISABLE_AUTO_TITLE='true'

# zoxide
eval "$(zoxide init zsh)"

# zsh-autosuggestions
source "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
bindkey '^y' autosuggest-accept # use <C-y> keybinding to accept autosuggestion

# zsh syntax highlighting
source "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"