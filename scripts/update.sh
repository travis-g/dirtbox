#!/bin/sh
set -ux

apk update && apk upgrade

apk add bash curl coreutils
