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
alias killsvn='find . -name ".svn" | xargs rm -Rf'
alias killgit='find . -name ".git" | xargs rm -Rf'
alias killterraform='find . -name ".terraform" | xargs rm -Rf'
alias killds='find . -name ".DS_Store" -type f -delete'

# get external ip
alias get_external_ip="curl -L -s --max-time 10 http://checkip.dyndns.org | egrep -o -m 1 '([[:digit:]]{1,3}\.){3}[[:digit:]]{1,3}'"

# pbcopy from tmux buffer
alias t2pb='tmux show-buffer | pbcopy'

# open something with Quick Look
alias qlf='qlmanage -p "$@"'

# k8s
alias k='kubectl'
alias kgcm='kubectl get cm'
alias kgdep='kubectl get deploy'
alias kgev='kubectl get ev'
alias kgsts='kubectl get sts'
alias kgsvc='kubectl get svc'
alias kgpo='kubectl get po -o wide'
alias kdpo='kubectl describe po "$@"'
alias kl='kubectl logs --tail=100  -f "$@"'
alias knetshoot='kubectl run --generator=run-pod/v1 tmp-shell --rm -i --tty --image nicolaka/netshoot -- /bin/bash'
