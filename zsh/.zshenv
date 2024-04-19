# For dotfiles
export XDG_CONFIG_HOME="$HOME/.config"

# For user specific data
export XDG_DATA_HOME="$HOME/.local/share"

# For user cached files
export XDG_CACHE_HOME="$HOME/.cache"

# editor
export EDITOR="nvim"
export VISUAL="nvim"

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Maximum events for internal history
export HISTSIZE=10000
# Maximum events in history file
export SAVEHIST=10000

# dotfiles
export DOTFILES="$HOME/dotfiles"

# fzf and ripgrep
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# PATH
export PATH="$HOME/work/git-helpers/bin:$PATH" # Bright Git Extensions
