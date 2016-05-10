#!/usr/bin/env bash


# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Ask for the administrator password upfront
sudo -v

# MacOSX App Store updates
e_header "MacOSX App Store updates"
sudo softwareupdate -i -a

# Install XCode Commandline Tools.
e_header "Installing XCode Commandline Tools"
if [[ ! "$(xcode-select -p)" ]]; then
  xcode-select --install
fi
