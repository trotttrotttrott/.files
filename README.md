# .files

The dot files of El Señor Christopher Douglas Trott

**Setup**

1. Clone to `~/.files`
1. Create symlinks to the stuff you want in your home directory.
1. If you symlink `.vimrc`, create these directories: `.vim/backup`, `.vim/tmp`.
1. Install `bash-completion` with homebrew as the PS1 declaration expects its presence.
1. Optionally create the following files and `.bashrc` will pick them up:
  * `~/.bash_projects`: for project specific aliases, functions, etc.
  * `~/.ec2/env.sh`: ec2 config.
  * `~/.rackspace/env.sh`: rackspace config.
  * `~/.chef/env.sh`: chef config.

---
---

*General machine setup notes:*

**Base Brews**

* ack
* bash-completion
* git
* imagemagick
* macvim
* reattach-to-user-namespace
* tmux
* tree
* vim
