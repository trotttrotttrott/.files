# .files

The dot files of El Señor Christopher Douglas Trott.

A lot of these files are obsolete. I'm moving toward using a NixOS VM on UTM for
dev and my OSX host machine for basic stuff.

## Bootstrapping OSX

I use [Homebrew](https://brew.sh/).

Install packages:
```
./brew-install
```

Change shell to bash:
```
echo /opt/homebrew/bin/bash | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/bash
```

Create symlinks in your home directory:
```
./create-symlinks
```

I use [vim-plug](https://github.com/junegunn/vim-plug). Prefer install method of
copying `plug.vim` to [.vim/autoload/](./vim/autoload).

## Bootstrapping NixOS VMs

See [nixos-config](./nixos-config).
