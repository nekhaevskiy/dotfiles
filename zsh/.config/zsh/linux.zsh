# fzf
# if [ $(command -v "fzf") ]; then
#     source "/usr/share/doc/fzf/examples/completion.zsh"
#     source "/usr/share/doc/fzf/examples/key-bindings.zsh"
# fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# starship
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"

# zsh-autosuggestions
source "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
bindkey '^y' autosuggest-accept # use <C-y> keybinding to accept autosuggestion

# zsh syntax highlighting
source "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
