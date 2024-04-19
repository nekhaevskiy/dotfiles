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

# enable vi mode
bindkey -v
export KEYTIMEOUT=1

# change cursor
autoload -Uz cursor_mode && cursor_mode

# edit commands in neovim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# fzf
if [ $(command -v "fzf") ]; then
    source "/usr/share/doc/fzf/examples/completion.zsh"
    source "/usr/share/doc/fzf/examples/key-bindings.zsh"
fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# zoxide
eval "$(zoxide init zsh)"

# zsh-autosuggestions
source "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
bindkey '^y' autosuggest-accept # use <C-y> keybinding to accept autosuggestion

# zsh syntax highlighting
source "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
