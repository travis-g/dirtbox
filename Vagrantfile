# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'
settings = YAML.load_file('Vagrantsettings.yaml')

$root = File.dirname(__FILE__)

Vagrant.configure(2) do |config|
  config.vm.box = "dirtbox.box"

  if Vagrant.has_plugin?("vagrant-timezone")
    config.timezone.value = "EST"
  end

  # mounts
  config.vm.synced_folder "./dotfiles", "/home/vagrant/dotfiles"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false

    vb.cpus = 2
    vb.memory = 1024
    vb.customize [
      'modifyvm', :id,
      '--natdnshostresolver1', 'on',
      '--nic1', 'nat',
      '--cableconnected1', 'on'
    ]

    vb.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 1000 ]
    vb.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-interval", 10000 ]
    vb.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-min-adjust", 100 ]
  end
  
  config.vm.provision "file", source: "bin/shutdown", destination: "/bin/shutdown"

  config.vm.provision "shell", run: "always", inline: <<-SHELL
    apk add --upgrade apk-tools
    apk cache -v sync
    apk upgrade -v
  SHELL

  config.vm.provision "shell", path: "scripts/custom.sh"
  config.vm.provision "shell", path: "scripts/dotfiles.sh"
end
