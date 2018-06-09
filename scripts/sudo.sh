set -eux
# Set up sudo

apk add sudo
adduser vagrant wheel

echo "Defaults exempt_group=wheel" > /etc/sudoers
echo "%wheel ALL=NOPASSWD:ALL" >> /etc/sudoers
