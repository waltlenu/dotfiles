#!/usr/bin/env zsh

# ~/.zshenv: executed by zsh(1) shells.

# If interactive, source ~/.config/shell/rc and ~/.config/bash/rc
[[ "$-" == *i* ]] && {\
  [ -r ~/.config/shell/rc ] && source ~/.config/shell/rc
  [ -d ~/.config/zsh ] && ZDOTDIR=~/.config/zsh
  [ -r ~/.config/shell/scratchpad ] && source ~/.config/shell/scratchpad
  [ -r ~/.config/shell/motd ] && source ~/.config/shell/motd
}

