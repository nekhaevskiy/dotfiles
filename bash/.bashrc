# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'

# Alias definitions
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# bright git helpers
export PATH=${PATH}:${HOME}/work/git-helpers/bin

# fzf-git.sh
source ~/fzf-git.sh/fzf-git.sh

# add ~/.local/bin to PATH
export PATH="$HOME/.local/bin:$PATH"

# initialize pyenv
eval "$(pyenv init - bash)"

# add pyenv-virtualenv to the shell (needed for JupyterLab)
eval "$(pyenv virtualenv-init -)"

###########
# scripts #
###########

# save cluster IP
cips() {
	# Check if an argument is provided
	if [ -z "$1" ]; then
		echo "No cluster IP provided."
		return 1
	fi

	echo "$1" >"$HOME/work/cluster-ip"
	export CLUSTER_IP="$1"
	echo "$CLUSTER_IP" | wl-copy
	echo "Cluster IP saved."
}

# load cluster IP
cipl() {
	export CLUSTER_IP=$(cat "$HOME/work/cluster-ip")
	echo "$CLUSTER_IP" | wl-copy
	echo "$CLUSTER_IP"
}

# remove a user-specified IP from the known_hosts file
sshr() {
	local ip="$1"
	if [ -z "$ip" ]; then
		echo "Usage: sshr <ip>"
		return 1
	fi

	ssh-keygen -f "$HOME/.ssh/known_hosts" -R "$ip"
	echo "IP $ip removed from known_hosts file."
}

# Set terminal title to current directory only (no username@hostname)
set_terminal_title() {
  echo -ne "\033]0;${PWD/#$HOME/\~}\007"
}
PROMPT_COMMAND="${PROMPT_COMMAND};set_terminal_title"
