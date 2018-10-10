#!/bin/sh
set -ux

# allow Packer to log in via SSH
sed -i '/^PermitRootLogin yes/d' /etc/ssh/sshd_config

# make 'vagrant ssh' connections faster
echo "UseDNS no" >> /etc/ssh/sshd_config
