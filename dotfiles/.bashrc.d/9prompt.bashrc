#!/bin/env bash

# Set a fancy prompt (with git, python virualenv, and debian chroot support).

function __ps1_context() {
  local context=""

  if [ -r /etc/debian_chroot ]; then
    context=("${context}c")
  fi

  if [ ! -z "$VIRTUAL_ENV" ]; then
    context=("${context}p")
  fi

  if [ -n "$context" ]; then
    echo " ($context)"
  fi
}

# See https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh for __git_ps1 function documentation.
# Note that GIT_PS1_SHOWCOLORHINTS requires the use of PROMPT_COMMAND.
if [[ -e /usr/lib/git-core/git-sh-prompt ]]; then
  . /usr/lib/git-core/git-sh-prompt
  GIT_PS1_SHOWCOLORHINTS=true
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWSTASHSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWUPSTREAM='verbose'

  # VIRTUAL_ENV is set by the activate shell script, see https://stackoverflow.com/a/1883251.
  __PROMPT='__git_ps1 "\u@\h:\w\$(__ps1_context)" "\\\$ "'

  if [ -z "$PROMPT_COMMAND" ]; then
    PROMPT_COMMAND="$__PROMPT"
  else
    PROMPT_COMMAND="$PROMPT_COMMAND; $__PROMPT"
  fi

  export PROMPT_COMMAND
  unset __PROMPT
else
  PS1='\u@\h:\w\$ '
fi
