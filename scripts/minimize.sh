#!/bin/sh
set -ux

# wipe /tmp
rm -rf /tmp/*

ls -lah /var/cache

dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
# force in memory to disk
sync
sync
sync

exit 0
