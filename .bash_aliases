#! /bin/bash

# general
alias ll='ls -la -h'
alias ls='ls -G'
alias c='clear'
alias g='git'
alias gs='git status'
alias gl='git log'
alias gt='git tag'
alias ..='cd ..'
alias screen='screen -U'
alias retag='ctags --extra=+f -R .'
alias flushdns='dscacheutil -flushcache'

# bundler
alias b='bundle'
alias bx='bundle exec'
alias bi='bundle install'

# rails
alias rg='bundle exec rails generate'
alias rs='bundle exec rails server'
alias rc='bundle exec rails console'
alias rd='bundle exec rails dbconsole'

# postgres
alias startpg='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'

# kill .svn files
alias killsvn='find . -name ".svn" | xargs rm -Rf'

# kill .DS_Store files (they're annoying)
alias killds='find . -name ".DS_Store" -type f -delete'

# get external ip
alias get_external_ip="curl -L -s --max-time 10 http://checkip.dyndns.org | egrep -o -m 1 '([[:digit:]]{1,3}\.){3}[[:digit:]]{1,3}'"
