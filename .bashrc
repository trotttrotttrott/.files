# tmux hits /etc/profile a second time when a session starts - farts up $path
if [ -n $TMUX ] && [ -f /etc/profile ]; then
  PATH=''
  source /etc/profile
fi

export GOPATH=$HOME/code/gocode

PATH=/usr/local/sbin:$PATH
PATH=/usr/local/bin:$PATH
PATH=/usr/local/opt/go/libexec/bin:$PATH
PATH=$GOPATH/bin:$PATH
PATH=$PATH:$HOME/.rbenv/bin
PATH=$PATH:/usr/local/packer/0.8.6
PATH=$PATH:/usr/local/terraform/0.6.10
PATH=$PATH:/usr/local/vault/0.4.0

eval "$(rbenv init -)" # initialize rbenv

eval "$($HOME/.chefvm/bin/chefvm init -)" # initialize chefvm

export PS1='\[\e[;97m\]\w $(rbenv version | sed -e "s/ .*//") $(chefvm current)$(__git_ps1 " (%s)")\n▸ \[\e[m\]'

export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.7.0_67.jdk/Contents/Home'

export VAULT_ADDR='http://127.0.0.1:8200'

export EDITOR=vim
export VISUAL=$EDITOR

export HISTIGNORE="&:[bf]g:c:exit" # Ignore repeat commands in history

# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# Use vim instead of less to browse man pages
export MANPAGER='bash -c "vim -MRn -c \"set ft=man nomod nolist nospell nonu\" \
-c \"nm q :qa!<CR>\" -c \"nm <end> G\" -c \"nm <home> gg\"</dev/tty <(col -b)"'

# ec2 api cli
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.6.13.0/libexec"

# recursive globbing
if ((${BASH_VERSINFO[0]} >= 4)) && ! shopt globstar > /dev/null; then
  shopt -s globstar
fi

# bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# functions
if [ -f ~/.bash_functions ]; then
  . ~/.bash_functions
fi

# private or doesn't belong in scm
if [ -f ~/.bash_private ]; then
  . ~/.bash_private
fi

# nova completion
if [ -f ~/.bash_nova_completion ]; then
  . ~/.bash_nova_completion
fi

# neutron completion
if [ -f ~/.bash_neutron_completion ]; then
  . ~/.bash_neutron_completion
fi

# cinder completion
if [ -f ~/.bash_cinder_completion ]; then
  . ~/.bash_cinder_completion
fi

# glance completion
if [ -f ~/.bash_glance_completion ]; then
  . ~/.bash_glance_completion
fi
