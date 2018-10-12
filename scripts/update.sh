#!/bin/sh
set -ux

apk update && apk upgrade

apk add bash coreutils
