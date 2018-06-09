# dirtbox

Dirt-plain Vagrant box built on [Alpine][alpine].

```console
$ gnumfmt --to=iec-i --suffix=B $(wc -c <dirtbox.box)
42MiB
```

### Build

```console
$ packer build dirtbox.json
...
==> Builds finished. The artifacts of successful builds are:
--> virtualbox-iso: 'virtualbox' provider box: dirtbox.box
$ vagrant up
```

## Todo

* Build date/last update time into `/etc/motd` or `/etc/profile`
* Shared folders ()
* Vagrantfile template to be included in Packer's post-processor as a default
* Better update provisioners (including Vagrant-side)

[alpine]: https://alpinelinux.org/
