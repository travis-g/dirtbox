#!/usr/bin/env bash
set -ex

apk upgrade -v
apk add {openssl,git,zsh,stow,python,py2-pip@edgecommunity}

