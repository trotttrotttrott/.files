# .files

The dot files of El Señor Christopher Douglas Trott.

## [Homebrew](https://brew.sh/)

```bash
brew install bash
echo /usr/local/bin/bash | sudo tee -a /etc/shells
chsh -s /usr/local/bin/bash
```

```bash
for formula in \
  bash-completion \
  git \
  nvim \
  tmux\
  krew; do
    brew install $formula
done
```

## ./create-symlinks

## [Asdf](https://github.com/asdf-vm/asdf)

```bash
for plugin in \
  kubectl \
  ruby \
  tanka \
  terraform \
  'jsonnet-bundler https://github.com/trotttrotttrott/asdf-jsonnet-bundler.git' \
  ; do
    asdf plugin-add $plugin
done
```

## Neovim

Use [vim-plug](https://github.com/junegunn/vim-plug).

```
python3 -m pip install --user --upgrade pynvim
python2 -m pip install --user --upgrade pynvim
gem install neovim
yarn global add neovim
```
