#!/bin/bash

# Update file with list of installed packages.
#
# Use this list with:
#  yay -S --needed - < packagelist

set -eufo pipefail

pacman -Qqe > packagelist
