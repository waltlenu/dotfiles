#!/usr/bin/env sh

###
### Shared shell settings (bash/zsh): aliases
###

#
## Colorize commands
#

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

#
## List files
#
if [ "$(command -v eza)" ]; then
	alias v='eza -a --git --long --header --time-style=long-iso'                     # Long listing
	alias vs='eza -a --git --long --header --time-style=long-iso --sort=size'        # Sort by size
	alias vt='eza -a --git --long --header --time-style=long-iso --sort=oldest'      # Sort by mtime-reversed
	alias vx='eza -a --git --long --header --time-style=long-iso --group --extended' # Show ACLs and xattrs
	alias tree='eza -a --ignore-glob=".git" --tree'
else
	alias la='ls -A --color=auto'
	alias v='ls -lhA'    # Long listing
	alias vs='ls -lhASr' # Sort by size-reversed
	alias vt='ls -lhAtr' # Sort by mtime-reversed
	alias vx='ls -lhAe@' # Show ACLs and xattrs
	alias tree='tree -aC -I .git --dirsfirst'
fi

# Disk usage
if [ "$(command -v ncdu)" ]; then
	alias d='ncdu'
else
	alias d='du -csh | sort -nk'
fi

# Aliases: misc
alias df='df -h'
alias ln='ln -v'
alias mkdir='mkdir -p'
alias mv='mv -vi'
alias p='ps fax'
alias rm='rm -v'

alias mc='mc -a'
alias tmux='tmux -2'
alias top='htop'
alias ag='rg'

alias clean_DS_Store='find . -name *.DS_Store -type f -print -delete'
alias dotfiles='chezmoi'

# Default programs
if [ "$(command -v most)" ]; then
	export PAGER='most'
	alias less='most'
else
	export PAGER='less'
	export LESS='-FMnqrX'
fi

# Editor
[ "$(command -v vim)" ] && {
	alias vi='vim'
	export EDITOR='vim'
	export VISUAL='vim'
}

[ "$(command -v nvim)" ] && {
	alias vi='nvim'
	export EDITOR='nvim'
	export VISUAL='nvim'
}

# Kubernetes
alias h='helm'
alias k='kubectl'
