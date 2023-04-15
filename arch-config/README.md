# Arch Linux Config

## Prerequisites

### UTM

https://mac.getutm.app/

### ArchLinux ARM

https://mac.getutm.app/gallery/archlinux-arm

## Creating a VM

https://wiki.archlinux.org/title/Installation_guide

1. Launch VM from gallery image

1. Encrypt filesystem

   **This part is just notes, I don't think it actually works :\**

   The gallery VM already has an unencrypted partition created. It can be
   encrypted with dm-crypt: [Encrypt an existing unencrypted file system](https://wiki.archlinux.org/title/Dm-crypt/Device_encryption#Encrypt_an_existing_unencrypted_file_system)

   Optionally confirm state of partition:

   ```
   fdisk -l
   # Assuming /dev/vda2
   blkid /dev/vda2
   ```

   Encrypt:

   ```
   e2fsck -f /dev/vda2
   resize2fs -p -M /dev/vda2
   cryptsetup reencrypt --encrypt --reduce-device-size 16M /dev/vda2
   cryptsetup open /dev/vda2 recrypt
   ```

1. Install things

   ```
   pacman -Syu \
     neovim \
     git \
     tmux \
     docker \
     kubectl
   ```

1. Start things

   ```
   systemctl start sshd.service
   systemctl start docker.service
   ```

1. Create user

   ```
   useradd -m trott
   su trott
   echo 'ssh-ed25519 ...' > /home/trott/authorized_keys

   eval "$(ssh-agent)"
   ```

1. Share `code/` dir

   TODO
