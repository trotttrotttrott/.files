# tmux hits /etc/profile a second time when a session starts - farts up $path
if [ -n $TMUX ] && [ -f /etc/profile ]; then
  PATH=''
  source /etc/profile
fi

PATH=/usr/local/sbin:$PATH
PATH=/usr/local/bin:$PATH
PATH=$PATH:$HOME/.rbenv/bin
PATH=$PATH:/usr/local/share/npm/bin

eval "$(rbenv init -)" # initialize rbenv

eval "$($HOME/.chefvm/bin/chefvm init -)" # initialize chefvm

export PS1='\[\033[1;97m\u \[\033[0;97m\w $(rbenv version | sed -e "s/ .*//") $(chefvm current)$(__git_ps1 " (%s)")
▸\[\033[00m\] '

export JAVA_HOME='/System/Library/Frameworks/JavaVM.framework/Home/' # jruby gets mad without this :\
export EDITOR=vim
export VISUAL=$EDITOR
export HISTIGNORE="&:[bf]g:c:exit" # Ignore repeat commands in history

# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# Use vim instead of less to browse man pages
export MANPAGER='bash -c "vim -MRn -c \"set ft=man nomod nolist nospell nonu\" \
-c \"nm q :qa!<CR>\" -c \"nm <end> G\" -c \"nm <home> gg\"</dev/tty <(col -b)"'

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

# ec2
if [ -f ~/.ec2/.env ]; then
  . ~/.ec2/.env
fi

# rackspace
if [ -f ~/.rackspace/.env ]; then
  . ~/.rackspace/.env
fi

# chef
if [ -f ~/.chef/.env ]; then
  . ~/.chef/.env
fi
