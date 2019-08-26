#! /bin/bash

# general
alias ll='ls -la -h'
alias ls='ls -G'
alias c='clear'

# docker
alias rmidang='docker rmi $(docker images --quiet --filter "dangling=true")'

# terraform
alias tp='terraform plan'

# dns
alias flushdns='dscacheutil -flushcache'

# kill stuff
alias killsvn='find . -name ".svn" | xargs rm -Rf' # :(
alias killterraform='find . -name ".terraform" | xargs rm -Rf' # nested module directories are big
alias killds='find . -name ".DS_Store" -type f -delete' # annoying, don't need em

# get external ip
alias get_external_ip="curl -L -s --max-time 10 http://checkip.dyndns.org | egrep -o -m 1 '([[:digit:]]{1,3}\.){3}[[:digit:]]{1,3}'"

# pbcopy from tmux buffer
alias t2pb='tmux show-buffer | pbcopy'

# open something with Quick Look
alias qlf='qlmanage -p "$@"'
