#!/usr/bin/env bash

# Checks the window size after each command and, if necessary,
# updates the values of LINES and COLUMNS
shopt -s checkwinsize

# Set TERM variables
TERM='xterm-256color'
# shellcheck disable=SC2034
COLORTERM='truecolor'

##
## Prompt
##

# Load startship (if installed)
if [ "$(command -v starship)" ]; then
  eval "$(starship init bash)"
fi
