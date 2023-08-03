#!/usr/bin/env bash

##
## XDG base directories
##

# shellcheck disable=SC2154
test -d "${XDG_CACHE_HOME}" || mkdir -p "${XDG_CACHE_HOME}"
test -d "${XDG_CONFIG_HOME}" || mkdir -p "${XDG_CONFIG_HOME}"
test -d "${XDG_DATA_HOME}" || mkdir -p "${XDG_DATA_HOME}"

##
## Set environment variables
##

# Set $SHELL
if [ -z "${SHELL}" ]; then
  SHELL="$(command -v bash)"
  export SHELL
fi

# Readline
export INPUTRC="${XDG_CONFIG_HOME}/readline/inputrc"

##
## Set options
##

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

##
## Bash completion
##

test -d "${XDG_CONFIG_HOME}/bash-completion" || mkdir -p "${XDG_CONFIG_HOME}/bash-completion"
export BASH_COMPLETION_USER_FILE="${XDG_CONFIG_HOME}/bash-completion/bash_completion"

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

##
## History
##

# file
test -d "${XDG_DATA_HOME}/bash" || mkdir -p "${XDG_DATA_HOME}/bash"
HISTFILE="${XDG_DATA_HOME}/bash/history"

# Size
HISTSIZE=32768

# Avoid duplicates
HISTCONTROL=ignoredups:erasedups

# Iignore
HISTIGNORE='&:ls:cd ~:cd ..:pwd:clear:[bf]g:exit:h:history'

# Set imestamps for later analysis. www.debian-administration.org/users/rossen/weblog/1
HISTTIMEFORMAT='%F %T '

# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
#!/usr/bin/env bash

##
## Tools
##

# Load direnv (if installed)
if [ "$(command -v direnv)" ]; then
  eval "$(direnv hook bash)"
fi
