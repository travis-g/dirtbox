#!/bin/sh
set -ux

# stow dotfiles
cd /home/vagrant/dotfiles
find * -type d -maxdepth 0 -exec stow {} \;
