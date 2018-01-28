export PATH=/usr/local/sbin:$PATH

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
. /usr/local/etc/bash_completion
. /usr/local/lib/azure-cli/az.completion

export EDITOR=vim
export VISUAL=$EDITOR

export HISTIGNORE='&:[bf]g:c:exit'

current() {
  asdf current $1 | sed -e "s/ .*//"
}

PS1='\[\e[;97m\]\w'
PS1=$PS1'$([ -v GS_NAME ] && echo " $(current ruby).gs")'
PS1=$PS1'$([ -v GO_PATH ] && echo " $(current go)")'
PS1=$PS1' ${SPECIAL_CONTEXT:-.}'
PS1=$PS1'$(__git_ps1)'
PS1=$PS1'\n▸ \[\e[m\]'

if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi
if [ -f ~/.bash_functions ]; then . ~/.bash_functions; fi
if [ -f ~/.bash_private ]; then . ~/.bash_private; fi

if [ -f ~/.bash_nova_completion ]; then . ~/.bash_nova_completion; fi
if [ -f ~/.bash_neutron_completion ]; then . ~/.bash_neutron_completion; fi
if [ -f ~/.bash_cinder_completion ]; then . ~/.bash_cinder_completion; fi
if [ -f ~/.bash_glance_completion ]; then . ~/.bash_glance_completion; fi
