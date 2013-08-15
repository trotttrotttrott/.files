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

export PS1='\[\e[1;97m\]\u \[\e[0;97m\]\w $(rbenv version | sed -e "s/ .*//")$(__git_ps1 " (%s)")\n\[\e[0;97m\]▸\[\e[0m\] '
export JAVA_HOME='/System/Library/Frameworks/JavaVM.framework/Home/' # jruby gets mad without this :\
export EDITOR=vim
export VISUAL=$EDITOR
export HISTIGNORE="&:[bf]g:c:exit" # Ignore repeat commands in history

# Use vim to browse man pages
export MANPAGER='bash -c "vim -MRn -c \"set ft=man nomod nolist nospell nonu\" \
-c \"nm q :qa!<CR>\" -c \"nm <end> G\" -c \"nm <home> gg\"</dev/tty <(col -b)"'

if ((${BASH_VERSINFO[0]} >= 4)) && ! shopt globstar >/dev/null; then
  shopt -s globstar # recursive globs fuck yes!
fi

alias gitk='gitk 2>/dev/null' # osx 10.8 hack to prevent dumb warnings when using gitk

# bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# hitch
hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]]; then
    source "$HOME/.hitch_export_authors"
  fi
}

alias unhitch='hitch -u'

# aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# functions
if [ -f ~/.bash_functions ]; then
  . ~/.bash_functions
fi

# projects
if [ -f ~/.bash_projects ]; then
  . ~/.bash_projects
fi

# ec2
if [ -f ~/.ec2/env.sh ]; then
  . ~/.ec2/env.sh
fi

# rackspace
if [ -f ~/.rackspace/env.sh ]; then
  . ~/.rackspace/env.sh
fi

# chef
if [ -f ~/.chef/env.sh ]; then
  . ~/.chef/env.sh
fi
