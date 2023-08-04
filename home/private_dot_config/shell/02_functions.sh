#!/usr/bin/env sh

###
### Shared shell settings (bash/zsh): functions
###

# Check if commands exist
commands_exist() {
  for cmd in "$@"; do
    command -v "$cmd" >/dev/null 2>&1 || return 1
  done
}

# Speed up script by not using unicode
disable_unicode() {
  export LC_ALL=C
  export LANG=C
}

# Colorize 'man'
man() {
  env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

# Colorized $PATH
path() {
  local blue="\\033[1;34m"
  local green="\\033[0;32m"
  local cyan="\\033[0;36m"
  local purple="\\033[0;35m"
  local brown="\\033[0;33m"
  local reset_color="\\033[0m"
  echo "$PATH" | tr ":" "\\n" |
    awk "{ sub(\"/usr\",   \"$green/usr$reset_color\"); \
           sub(\"/bin\",   \"$blue/bin$reset_color\"); \
           sub(\"/opt\",   \"$cyan/opt$reset_color\"); \
           sub(\"/sbin\",  \"$purple/sbin$reset_color\"); \
           sub(\"/local\", \"$brown/local$reset_color\"); \
           print }"
}

# Random password generator
# Alternative:  openssl rand -base64 12
randpassgen() {
  local number="$1"
  local lenght="$2"
  : "${number:='1'}"
  : "${lenght:='16'}"
  local prefix='https://www.random.org/strings'
  local suffix='digits=on&upperalpha=on&loweralpha=on&unique=off&format=plain&rnd=new'
  local url="$prefix/?num=$number&len=$lenght&$suffix"
  [ "$(command -v curl)" ] && curl --silent "$url"
}

# Set title of terminal window/tab
# $*: string
title() {
  local title=$*
  echo -ne "\\033]0;$title\\007"
}

# Weather (defaults to London, UK)
weather() {
  command -v curl >/dev/null 2>&- && curl --silent http://wttr.in/London
}
