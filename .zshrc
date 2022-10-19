if [ -n $TMUX ]; then
  PATH=''
  source /etc/profile
fi

alias v='nvim'
alias ll='ls -lah'
alias t2pb='tmux show-buffer | pbcopy'

eval "$(/opt/homebrew/bin/brew shellenv)"

export CLICOLOR=1

PS1='%# '
