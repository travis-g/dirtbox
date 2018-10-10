#!/usr/bin/env bash
set -ex

apk upgrade -v
apk add {openssl,git,zsh,vim,stow,python,py2-pip@edgecommunity}

apk add neofetch@edgecommunity
