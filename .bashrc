export USER='trotttrotttrott'

export PS1='\[\e[1;97m\]trotttrotttrott \[\e[0;97m\]\w $(~/.rvm/bin/rvm-prompt)$(__git_ps1 " (%s)")\n\[\e[0;97m\]▸\[\e[0m\] '

export DYLD_LIBRARY_PATH='/usr/local/mysql/lib/'

export JAVA_HOME='/System/Library/Frameworks/JavaVM.framework/Home/' # jruby gets mad without this :\

# Editor
export EDITOR=vim
export VISUAL=$EDITOR

# Ignore from history repeat commands, and some other unimportant ones
export HISTIGNORE="&:[bf]g:c:exit"

# Use vim to browse man pages. One can use Ctrl-[ and Ctrl-t
# to browse and return from referenced man pages. ZZ or q to quit.
# NOTE: initially within vim, one can goto the man page for the
#       word under the cursor by using [section_number]K.
export MANPAGER='bash -c "vim -MRn -c \"set ft=man nomod nolist nospell nonu\" \
-c \"nm q :qa!<CR>\" -c \"nm <end> G\" -c \"nm <home> gg\"</dev/tty <(col -b)"'

if ((${BASH_VERSINFO[0]} >= 4)) && ! shopt globstar >/dev/null; then
  shopt -s globstar # recursive globs fuck yes!
fi

# bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

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

# chef
if [ -f ~/.chef/env.sh ]; then
  . ~/.chef/env.sh
fi
