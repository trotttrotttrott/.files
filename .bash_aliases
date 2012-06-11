################ scripts

alias t='ruby ~/tasks/tasks.rb'

################ projects

# etcetera
alias etcetera='cd ~/Documents/etcetera/ruby'
alias ssh_etc_proddb_01='ssh -v -i ~/.ec2/etcetera ec2-user@ec2-67-202-3-134.compute-1.amazonaws.com'

# gn
alias sshgnprodweb01='ssh -v -i ~/.ec2/etcetera ec2-user@ec2-107-22-199-215.compute-1.amazonaws.com'

#marqeta
alias marqeta='cd ~/Documents/marqeta/ruby/marqeta'
alias jcard='cd ~/Documents/marqeta/java/marqeta/branches/edge'

# trotttrotttrott
alias ttt='cd ~/Documents/trotttrotttrott/ruby/trotttrotttrott'
alias ssh_ttt='ssh -v -i ~/.ec2/etcetera ec2-user@ec2-184-72-225-39.compute-1.amazonaws.com'

# ham_and_eggs
alias ham='cd ~/Documents/ham_and_eggs/ruby/ham_and_eggs'

# know-tow-fied
alias ktf='cd ~/Documents/know-tow-fied/ruby/know_tow_fied'
alias sshktf='ssh -v -i ~/.ec2/trotttrotttrott.pem ec2-user@ec2-23-21-131-245.compute-1.amazonaws.com'

################ cd

# config shortcuts
alias nginx_conf='cd /usr/local/etc/nginx'
alias apache2='cd /private/etc/apache2'

################ open

alias oad='open /Applications/Adium.app'
alias oadd='open /Applications/Address\ Book.app'
alias obridge='open /Applications/Adobe\ Bridge\ CS5.1/Adobe\ Bridge\ CS5.1.app'
alias ocal='open /Applications/iCal.app'
alias ochar='open /Applications/Charles.app'
alias ochro='open /Applications/Google\ Chrome.app'
alias ocon='open /Applications/Utilities/Console.app'
alias ocy='open /Applications/Cyberduck.app'
alias odash='open /Applications/Dashboard.app'
alias ofire='open /Applications/Firefox5.app'
alias ogo='open /Applications/GoToMeeting.app'
alias ograb='open /Applications/Utilities/Grab.app'
alias ohip='open /Applications/HipChat.app'
alias oil='open /Applications/Adobe\ Illustrator\ CS5/Adobe\ Illustrator.app'
alias oim='open /Applications/Image\ Capture.app'
alias okey='open /Applications/Utilities/Keychain\ Access.app'
alias olog='open /Applications/Logic\ Pro.app'
alias omail='open /Applications/Mail.app'
alias omou='open /Applications/Mou.app'
alias omock='open /Applications/Balsamiq\ Mockups.app'
alias omon='open /Applications/Utilities/Activity\ Monitor.app'
alias omy='open /Applications/MySQLWorkbench.app'
alias opho='open /Applications/Adobe\ Photoshop\ CS5/Adobe\ Photoshop\ CS5.app'
alias osaf='open /Applications/Safari.app'
alias ose='open /Applications/Sequel\ Pro.app'
alias oskype='open /Applications/Skype.app'
alias ospot='open /Applications/Spotify.app'
alias otunes='open /Applications/iTunes.app'
alias otwitt='open /Applications/Twitter.app'
alias ov='open /Applications/VLC.app'
alias ovir='open /Applications/VirtualBox.app'

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
