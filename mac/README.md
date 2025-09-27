# Mac

1. [Homebrew](https://brew.sh/).

1. Clone this repo

1. Install packages

   ```
   eval "$(/opt/homebrew/bin/brew shellenv)"
   ./brew-install
   ```

1. Change shell to bash:

   ```
   echo /opt/homebrew/bin/bash | sudo tee -a /etc/shells
   chsh -s /opt/homebrew/bin/bash
   ```

1. Create symlinks in your home directory:

   ```
   ./create-symlinks
   ```

1. [vim-plug](https://github.com/junegunn/vim-plug). Prefer install method of
   copying `plug.vim` to [.vim/autoload/](./vim/autoload).
