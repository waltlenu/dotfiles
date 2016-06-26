#!/usr/bin/env bash


# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Install/Update Homebrew.
if [[ ! "$(command -v brew)" ]]; then
  e_header "Install Homebrew"
  true | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" \
    || { e_error "Homebrew install failed" && return 1; }
else
  e_header "Update Homebrew"
  brew update || { e_error "Homebrew update failed" && return 1; }
fi

# Tap Homebrew bundle to enable Brewfiles
e_header "Tap Homebrew bundle to enable Brewfiles"
brew tap homebrew/bundle || { e_error "Homebrew bundle tap failed" && return 1; }

# Upgrade all brews
e_header 'Homebrew upgrade all'
brew upgrade || { e_error "Homebrew upgrade failed" && return 1; }

# Install from Brewfile
e_header "Homebrew bundle install"
brew bundle || { e_error "Homebrew bundle install failed" && return 1; }

# Cleanup all oudated brews
e_header "Homebrew cleanup any outdated formulas from the cellar"
brew cleanup || { e_error "Homebrew cleanup failed" && return 1; }
brew cask cleanup || { e_error "Homebrew cask cleanup failed" && return 1; }
echo; e_success "Homebrew up-to-date"; echo

# Check Homebrew's status
brew doctor || { echo; e_error "Homebrew doctor failed" && return 1; }

