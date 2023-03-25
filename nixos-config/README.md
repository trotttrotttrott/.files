# NixOS Config

Configs for running NixOS on Apple M2 with UTM.

Initially inspired by https://github.com/mitchellh/nixos-config.

Very much a work in progress...

## Prerequisites

### ISO

Check the "Getting the installer image (ISO)" section on:

https://nixos.wiki/wiki/NixOS_on_ARM/UEFI

### UTM

https://mac.getutm.app/

## Creating a VM

1. Create VM with UTM...New + Virtualize + Linux

1. Select your ISO file

1. Hardware: probably set memory to half (or more) of what you've got. CPU cores
   default? Enable hardware acceleration.

1. Storage: 512 GB?

1. Shared Directory: ? (I haven't gotten this to work yet)

1. Summary: rename it, check "Open VM Settings"

1. Drives: create new NVMe drive with size 448 GB (arbitrary). Move it up to the
   top (this is so once formatted, the OS will load from here instead of the
   ISO).

1. Click "Save"

1. Start the VM

1. Select first option at GNU Grub prompt

1. `sudo su`, then `passwd` and change the password to "root"

1. `ifconfig` to get the IP address

1. Locally run, `NIXADDR=192.168.64.14 make vm/bootstrap0` - sets up disks, sets
   some config, reboots

1. Locally run, `NIXADDR=192.168.64.14 make vm/bootstrap` - copies configs,
   rebuilds, reboots
