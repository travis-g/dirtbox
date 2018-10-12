# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'
settings = YAML.load_file('Vagrantsettings.yaml')

$root = File.dirname(__FILE__)

Vagrant.configure(2) do |config|
  config.vm.box = settings["vm"]["box"]

  if Vagrant.has_plugin?("vagrant-timezone")
    config.timezone.value = settings["vm"]["timezone"]
  end

  # mounts
  config.vm.synced_folder "./dotfiles", "/home/vagrant/dotfiles"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = settings["vm"]["gui"]

    vb.cpus = settings["vm"]["cpus"]
    vb.memory = settings["vm"]["memory"]
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

  # Copy the custom shutdown wrapper so that we can halt with the CLI
  config.vm.provision "shell", run: "always", inline: <<-SHELL
    cp /vagrant/bin/shutdown /bin/shutdown
  SHELL

  config.vm.provision "shell", run: "always", inline: <<-SHELL
    setup-apkcache /var/cache/apk
    apk add --upgrade apk-tools
    apk cache -v sync
    apk upgrade -v
  SHELL

  config.vm.provision "shell", path: "scripts/custom.sh"
  config.vm.provision "shell", path: "scripts/dotfiles.sh", privileged: false
end
