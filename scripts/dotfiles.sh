#!/bin/sh

cd /home/vagrant/dotfiles || (
    echo "~/dotfiles not found! Skipping."
    exit 0
)

# stow dotfiles
find * -type d -maxdepth 0 -exec stow {} \;
