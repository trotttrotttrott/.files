#! /bin/bash

# general
alias v='nvim'
alias ll='ls -la -h'
alias ls='ls -G'
alias c='clear'
alias ag='ag --hidden'

# docker
alias rmidang='docker rmi $(docker images --quiet --filter "dangling=true")'
alias dprune='docker system prune'

# terraform
alias tp='terraform plan'

# dns
alias flushdns='dscacheutil -flushcache'

# kill stuff
alias killsvn='find . -name ".svn" | xargs rm -Rf'
alias killgit='find . -name ".git" | xargs rm -Rf'
alias killterraform='find . -name ".terraform" | xargs rm -Rf'
alias killnodemodules='find . -name "node_modules" | xargs rm -Rf'
alias killgs='find . -name ".gs" | xargs rm -Rf'
alias killds='find . -name ".DS_Store" -type f -delete'
alias killadobe="ps axuwww | grep Adobe | grep -v grep | awk '{print \$2}' | xargs sudo kill -9"

# get external ip
alias get_external_ip="curl -L -s --max-time 10 http://checkip.dyndns.org | egrep -o -m 1 '([[:digit:]]{1,3}\.){3}[[:digit:]]{1,3}'"

# pbcopy from tmux buffer
alias t2pb='tmux show-buffer | pbcopy'

# open something with Quick Look
alias qlf='qlmanage -p "$@"'
