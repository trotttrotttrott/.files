# .files

The dot files of El Señor Christopher Douglas Trott.

A lot of these files are obsolete. I'm moving toward using a NixOS VM on UTM for
dev and my OSX host machine for basic stuff.

## Bootstrapping OSX

I don't bother changing the shell anymore and default to Zsh.

I use [Homebrew](https://brew.sh/) to install `git`, `tmux`, `nvim`, and `pass`.

I use [vim-plug](https://github.com/junegunn/vim-plug). Prefer install method of
copying `plug.vim` to [.vim/autoload/](./vim/autoload).

Create symlinks in your home directory for:

* .config/nvim/init.vim
* .gitconfig
* .tmux.conf
* .vim
* .vimrc
* .zshrc

## Bootstrapping NixOS VMs

See [nixos-config](./nixos-config).
