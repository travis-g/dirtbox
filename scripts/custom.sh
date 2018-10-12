#!/usr/bin/env bash
set -e

apk upgrade -v
apk add {openssl,git,zsh,vim,stow,python,py2-pip@edgecommunity}

apk add neofetch@edgecommunity
