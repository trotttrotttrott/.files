#!/usr/bin/env bash

if [ -n $TMUX ]; then
  PATH=''
  source /etc/profile
fi

alias v='nvim'
alias ll='ls -lah'
alias t2pb='tmux show-buffer | pbcopy'

eval "$(/opt/homebrew/bin/brew shellenv)"
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

export CLICOLOR=1

export EDITOR=nvim
export VISUAL=$EDITOR

# Ignore repeated commands in history.
export HISTIGNORE='&:[bf]g:c:exit'

PS1='\[\e[;97m\]\w'
PS1=$PS1'$(__git_ps1)'
PS1=$PS1'\n▸ \[\e[m\]'
