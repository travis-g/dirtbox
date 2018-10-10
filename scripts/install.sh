#!/bin/sh
set -ux

# add edge repos
cat <<EOF >> /etc/apk/repositories
http://dl-cdn.alpinelinux.org/alpine/edge/main
@edgecommunity http://dl-cdn.alpinelinux.org/alpine/edge/community
EOF
apk update -v
