#!/usr/bin/env sh

###
### Shared shell settings (bash/zsh): path
###

# Prefix PATH with local user binary directory
test -d "$HOME/.local/bin" && export PATH="$HOME/.local/bin:$PATH"

# Append Kubectl Krew plugins to PATH
test -d "$HOME/.krew/bin" && export PATH="$HOME/.krew/bin:$PATH"
