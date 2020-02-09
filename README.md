# .files

The dot files of El Señor Christopher Douglas Trott.

## Submodules

Initialize after cloning:

```bash
git submodule update --init --recursive
```

Update:

```bash
cd ...
git co master
git pull origin master
cd ../... && git ci ...
```

Add new:

```bash
git submodule add git@... path/to/put/submodule
```

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
  vim \
  tmux\
  krew; do
    brew install $formula
done
```

## [Asdf](https://github.com/asdf-vm/asdf)

```bash
for plugin in \
  'golang https://github.com/kennyp/asdf-golang.git' \
  'kubectl https://github.com/Banno/asdf-kubectl.git' \
  'ruby https://github.com/asdf-vm/asdf-ruby.git' \
  'tanka https://github.com/trotttrotttrott/asdf-tanka.git' \
  'terraform https://github.com/Banno/asdf-hashicorp.git'; do
    asdf plugin-add $plugin
done
```
