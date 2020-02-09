# .files

The dot files of El Señor Christopher Douglas Trott.

## Submodules

Initialize after cloning:

```
git submodule update --init --recursive
```

Update:

```
cd ...
git co master
git pull origin master
cd ../... && git ci ...
```

Add new:

```
git submodule add git@... path/to/put/submodule
```

## [Homebrew](https://brew.sh/)

```
brew install bash
echo /usr/local/bin/bash | sudo tee -a /etc/shells
chsh -s /usr/local/bin/bash
```

```
for formula in \
  bash-completion \
  git \
  vim \
  tmux; do
    brew install $formula
done
```

## [Asdf](https://github.com/asdf-vm/asdf)

[.bashrc](.bashrc) expects `asdf` to be present along with the Ruby and Go [plugins](https://github.com/asdf-vm/asdf-plugins).
