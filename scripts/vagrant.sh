#!/bin/sh
set -eux

date > /etc/vagrant_box_build_time

adduser -D vagrant
echo "vagrant:vagrant" | chpasswd

mkdir -pm 700 /home/vagrant/.ssh

# get public Vagrant SSH key
wget -O /home/vagrant/.ssh/authorized_keys \
  'https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub'

chown -R vagrant:vagrant /home/vagrant/.ssh
chmod -R go-rwsx /home/vagrant/.ssh
# change login shell manually
sed -i'' 's;/home/vagrant:/bin/ash;/home/vagrant:/bin/bash;' /etc/passwd
