#! /bin/bash

# general
alias ll='ls -la -h'
alias ls='ls -G'
alias c='clear'

# git
alias g='git'
alias gs='git status'
alias gl='git log'

# docker
alias rmidang='docker rmi $(docker images --quiet --filter "dangling=true")'

# terraform
alias tp='terraform plan'

# dns
alias flushdns='dscacheutil -flushcache'

# bundler
alias bx='bundle exec'

# rails
alias rs='bundle exec rails server'
alias rc='bundle exec rails console'

# postgres
alias startpg='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias stoppg='pg_ctl -D /usr/local/var/postgres stop'

# kill .svn files
alias killsvn='find . -name ".svn" | xargs rm -Rf'

# kill .DS_Store files (they're annoying)
alias killds='find . -name ".DS_Store" -type f -delete'

# get external ip
alias get_external_ip="curl -L -s --max-time 10 http://checkip.dyndns.org | egrep -o -m 1 '([[:digit:]]{1,3}\.){3}[[:digit:]]{1,3}'"

# pbcopy from tmux buffer
alias t2pb='tmux show-buffer | pbcopy'

# open something with Quick Look
alias qlf='qlmanage -p "$@"'
