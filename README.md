# dirtbox

Dirt-plain [Alpine Linux][alpine] [Vagrant][vagrant] box built with [Packer][packer].

```console
$ gnumfmt --to=iec-i --suffix=B $(wc -c <dirtbox.box)
44MiB
```

* All of the basic configurations are done by Packer when making the `.box`, including setting `/etc/motd` with the build date.
* The version of VirtualBox's Guest Additions used is an [aport][aports] (Guest Additions has to be manually patched to work with Alpine.)
* I keep some basic configs in `dotfiles/` and symlink them into place with [GNU Stow][stow].
* Tweak the `custom.sh` script to add/remove packages.

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
Alpine Linux v3.7 (Built 2018-06-09)
dirtbox:~$ neofetch
vagrant@dirtbox
---------------
OS: Alpine Linux x86_64
Uptime: 1 min
Packages: 82
Memory: 23MiB / 996MiB
Local IP: 10.0.2.15
```

## Todo

* Better "update" provisioners (including Vagrant-side)
* Descriptions of what each Packer/Vagrant script does
* Fine tune `<wait>` instructions when building

[alpine]: https://alpinelinux.org/
[aports]: https://github.com/alpinelinux/aports
[packer]: https://www.packer.io/
[stow]: https://www.gnu.org/software/stow/
[vagrant]: https://www.vagrantup.com/

<!-- vim: ts=2 sw=2 softtabstop=2 expandtab -->
