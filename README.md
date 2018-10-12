# dirtbox

Dirt-plain [Alpine Linux][alpine] [Vagrant][vagrant] box built with [Packer][packer].

```console
$ numfmt --to=iec-i --suffix=B $(wc -c <dirtbox.box)
43MiB
```

* All of the basic configurations are done by Packer when making the `.box`, including setting `/etc/motd` with the build date.
* Both `vagrant halt` and `vagrant reboot` are enabled via wrapper script.
* Synced folders are supported via an [aport][aports] of [VirtualBox Guest Additions][aport-guest-additions]. The port is a bit outdated, but folders don't need to be shared via NFS or rsync.

### Usage

```console
$ packer build dirtbox.json # build
...
==> Builds finished. The artifacts of successful builds are:
--> virtualbox-iso: 'virtualbox' provider box: dirtbox.box
$ vagrant up # run
Bringing machine 'default' up with 'virtualbox' provider...
...
$ vagrant ssh # use
Alpine Linux v3.7 (Built 2018-10-11)
dirtbox:~$ neofetch
vagrant@dirtbox
---------------
OS: Alpine Linux x86_64
Uptime: 15 mins
Packages: 82 (apk)
Memory: 23MiB / 996MiB
Local IP: 10.0.2.15
dirtbox:~$ wc -c </vagrant/dirtbox.box | numfmt --to=iec-i --suffix=B
43MiB
```

* Configs organized in `dotfiles/` are symlinked into place with [GNU Stow][stow]. Note that line endings of any config files shared to the Vagrant box should be Unix-style/LF line endings.
* To modify the VM settings you can modify the `Vagrantsettings.yaml`.
* Tweak the `custom.sh` script to add/remove packages and add any custom code.

[alpine]: https://alpinelinux.org/
[aport-guest-additions]: https://github.com/alpinelinux/aports/tree/master/community/virtualbox-guest-additions
[aports]: https://github.com/alpinelinux/aports
[packer]: https://www.packer.io/
[stow]: https://www.gnu.org/software/stow/
[vagrant]: https://www.vagrantup.com/

<!-- vim: ts=2 sw=2 softtabstop=2 expandtab -->
