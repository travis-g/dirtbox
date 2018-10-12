#!/bin/sh
set -ux

apk upgrade -U --available

# set MOTD with OS/build info
. /etc/os-release
cat <<EOF > /etc/motd
$PRETTY_NAME (Built $(date -I))
EOF
