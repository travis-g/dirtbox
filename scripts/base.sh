set -ux

apk upgrade -U --available

# set MOTD with OS/build info
source /etc/os-release
cat <<EOF > /etc/motd
$PRETTY_NAME (Built $(date -I))
EOF

