################ scripts

alias t='ruby ~/tasks/tasks.rb'

################ cd

# config shortcuts
alias nginx_conf='cd /usr/local/etc/nginx'
alias apache2='cd /private/etc/apache2'

################ helpers

# general
alias ll='ls -la'
alias ls='ls -G'
alias c='clear'
alias g='git'
alias gs='git status'
alias gl='git log'
alias ..='cd ..'
alias screen='screen -U'
alias retag='ctags --extra=+f -R .'
alias flushdns='dscacheutil -flushcache'

# rails
alias rg='script/rails generate'
alias rs='script/rails server'
alias rc='script/rails console'
alias rd='script/rails dbconsole'

# bundler
alias b='bundle'
alias bx='bundle exec'
alias bi='bundle install'

# mysql
alias start_mysql='/Library/StartupItems/MySQLCOM/MySQLCOM start'
alias stop_mysql='/Library/StartupItems/MySQLCOM/MySQLCOM stop'

# remove .svn files and folders
alias f_u_svn='find ./ -name ".svn" | xargs rm -Rf'

# get external ip
alias get_external_ip="curl -L -s --max-time 10 http://checkip.dyndns.org | egrep -o -m 1 '([[:digit:]]{1,3}\.){3}[[:digit:]]{1,3}'"

# project aliases
if [ -f ~/.bash_project_shortcuts ]; then
  . ~/.bash_project_shortcuts
fi
