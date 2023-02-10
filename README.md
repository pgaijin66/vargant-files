# My vagrant files

# Table of contents

- [Install vargant](#install-vargant)
- [After installation](#after-installation)
- [Vagrant commands](#vagrant-commands)
  - [Start VM](#start-vm)
  - [Listing running vms](#listing-running-vms)
  - [Shutdown box](#shutdown-box)
  - [SSH uto your machine](#ssh-uto-your-machine)
  - [List vagrant boxes](#list-vagrant-boxes)
  - [Destory running vm](#destory-running-vm)
  - [Remove vagrant boxes](#remove-vagrant-boxes)
  - [Exit from box](#exit-from-box)
- [Gotcha](#gotcha)

## Install vargant

https://developer.hashicorp.com/vagrant/downloads

Note: Vagrant requires vm providers to work. Make sure you have either of the followings installed before hand

```shell
1) hyperv
2) libvirt
3) virtualbox
4) vmware_desktop
```

I use virtual box :).

## After installation

After installing vagrant add `vbguest` plugin. This will save you from a lot of hassel.Trust me ;). More here: https://github.com/dotless-de/vagrant-vbguest

```shell
$ vagrant plugin install vagrant-vbguest
```


## Vagrant commands

### Start VM

```shell
cd VM_FOLDER
$ vagrant up
```

### Listing running vms

```shell
$ vagrant status

Current machine states:

centos8                      running (virtualbox)
ubuntu64                     running (virtualbox)
```

### Shutdown box

```shell
$ vagrant halt BOX_NAME
```

### SSH uto your machine

```shell
$ vagrant ssh [VM_NAME]
```

eg:
```shell
$ vagrant ssh centos8

Welcome to your Vagrant-built virtual machine.
Last login: Fri Sep 14 06:23:18 2012 from 10.0.2.2
vagrant@centos:~ 
```

### List vagrant boxes

```shell
$ vagrant box list
```
### Destory running vm

```shell
$ vagrant destroy [VM_NAME]
```

Note: Removing box is different to destorying vm.

### Remove vagrant boxes

```shell
$ vagrant box remove list
```

### Exit from box

```shell
$ vagrant ssh centos8

Welcome to your Vagrant-built virtual machine.
Last login: Fri Sep 14 06:23:18 2012 from 10.0.2.2
vagrant@centos:~ logout
```

## Gotcha

If you get error like 

```
umount /mnt

Stdout from the command:



Stderr from the command:

umount: /mnt: not mounted
```

Simply backport the vbguet to 0.21 which works

``` shell
vagrant plugin uninstall vagrant-vbguest
vagrant plugin install vagrant-vbguest --plugin-version 0.21
```