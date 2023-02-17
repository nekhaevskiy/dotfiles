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

# History filepath
export HISTFILE="$ZDOTDIR/.zhistory"
# Maximum events for internal history
export HISTSIZE=10000
# Maximum events in history file
export SAVEHIST=10000

# dotfiles
export DOTFILES="$HOME/dotfiles"

# fzf and ripgrep
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# man
export MANPAGER='nvim +Man!'
export MANWIDTH=999

# IBus (different input methods)
export GTK_IM_MODULE="ibus"
export QT_IM_MODULE="ibus"
export XMODIFIERS="@im=ibus"

# PATH
export PATH="$HOME/work/git-helpers/bin:$PATH" # Bright Git Extensions
export PATH="$HOME/work/repository-utils:$PATH" # Bright repository-utils
# export PATH="$HOME/.local/bin":$PATH
# export PATH="$HOME/.local/share/neovim/bin":$PATH
# export PATH="$PATH:./node_modules/.bin"

# terminal
export TERMINAL="alacritty"

