#!/usr/bin/env bash

if [ -n "$TMUX" ]; then
  PATH=''
  source /etc/profile
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

for p in \
  '/opt/homebrew/etc/profile.d/bash_completion.sh' \
  '/Users/trott/.orbstack/shell/init.bash' \
  ; do
  [[ -r "$p" ]] && . "$p"
done

export PATH=$PATH:$HOME/go/bin

export CLICOLOR=1

export EDITOR=nvim
export VISUAL=$EDITOR

# Ignore repeated commands in history.
export HISTIGNORE='&:[bf]g:c:exit'

PS1='\[\e[;97m\]\w'
PS1=$PS1'$(__git_ps1)'
PS1=$PS1'\n▸ \[\e[m\]'

for f in ~/.bashrc.d/.*; do
  . "$f"
done
