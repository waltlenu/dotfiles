#!/usr/bin/env sh

# Be strict
set -eu

source_repo="${source_repo:-https://github.com/waltlenu/dotfiles}"
dest_dir="${dest_dir:-Devel/waltlenu/dotfiles}"

# Check if commands exist
commands_exist() {
  for cmd in "$@"; do
    command -v "$cmd" >/dev/null 2>&1 || \
      { echo >&2 "$cmd not available. Aborting!"; return 1; }
  done
}

# Bring local copy of dotfiles repository up to date
repo_update() (
  commands_exist git
  [ -e "$HOME/$dest_dir/.git" ] && \
    echo "Found git repository: $HOME/$dest_dir"
  [ ! -e "$HOME/$dest_dir" ] && \
    git clone "$source_repo" "$HOME/$dest_dir" || true
)

# Install packages with Arch Linux's pacman
pacman_install() {
  commands_exist pacman
  sudo pacman -Sy --needed --noconfirm "$@"
}

# Install packages with Arch Linux's pacman
aur_install() {
  commands_exist pacaur
  pacaur -Sy --needed --noconfirm "$@"
}

# Install ArchLinux User Repository helpers
aur_helper_install() (
  mkdir -p "$HOME/.cache/pacaur"
  cd "$HOME/.cache/pacaur"

  # Install cower
  gpg --recv-keys 1EB2638FF56C0C53
  curl -sSL -o PKGBUILD \
    https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=cower
  makepkg -i PKGBUILD --needed --noconfirm

  # Install pacaur
  cower -d -t "$HOME/.cache/pacaur" pacaur
  cd "$HOME/.cache/pacaur"
  makepkg -i PKGBUILD --needed --noconfirm
)

#
# Main
#

main() {
  # Detect operating system
  commands_exist uname sudo
  os="$(uname)"

  if [ "$os" = 'Linux' ]; then
    if [ -r '/etc/arch-release' ]; then
      echo 'Detected: Arch Linux'
      pacman_install curl expac git gnupg stow sudo yajl
      repo_update
      commands_exist cower pacaur || aur_helper_install
      aur_install $(cat "$HOME/$dest_dir/pacman.pkgs" "$HOME/$dest_dir/aur.pkgs")
    fi
  elif [ "$os" = 'Darwin' ]; then
    echo 'Detected: MacOS'
  fi
}

main
