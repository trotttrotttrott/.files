if [ -n $TMUX ]; then
  PATH=''
  source /etc/profile
fi

for script in \
  $HOME/.asdf/asdf.sh \
  $HOME/.asdf/completions/asdf.bash \
  /usr/local/etc/bash_completion \
  $HOME/.bash_k8s \
  $HOME/.bash_aliases \
  $HOME/.bash_functions \
  $HOME/.bash_private \
  ; do
  if [ -f $script ]; then . $script; fi
done

export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.krew/bin

export EDITOR=nvim
export VISUAL=$EDITOR

# Ignore repeated commands in history.
export HISTIGNORE='&:[bf]g:c:exit'

current() {
  asdf current $1 | sed -e "s/ .*//"
}

PS1='\[\e[;97m\]\w'
PS1=$PS1'$([ -v GS_NAME ] && echo " $(current ruby).gs")'
PS1=$PS1' ${SPECIAL_CONTEXT:-.}'
PS1=$PS1'$(__git_ps1)'
PS1=$PS1'\n▸ \[\e[m\]'
