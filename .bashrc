. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
. /usr/local/etc/bash_completion

PS1='\[\e[;97m\]\w $(asdf current ruby | sed -e "s/ .*//")$([[ -v GS_NAME ]] && echo ".gs") ${M2X_TENANT:-.}$(__git_ps1 " (%s)")\n▸ \[\e[m\]'

export EDITOR=vim
export VISUAL=$EDITOR

export HISTIGNORE='&:[bf]g:c:exit' # Ignore repeat commands in history

if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi
if [ -f ~/.bash_functions ]; then . ~/.bash_functions; fi
if [ -f ~/.bash_private ]; then . ~/.bash_private; fi

if [ -f ~/.bash_nova_completion ]; then . ~/.bash_nova_completion; fi
if [ -f ~/.bash_neutron_completion ]; then . ~/.bash_neutron_completion; fi
if [ -f ~/.bash_cinder_completion ]; then . ~/.bash_cinder_completion; fi
if [ -f ~/.bash_glance_completion ]; then . ~/.bash_glance_completion; fi
