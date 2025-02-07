# ~/.bashrc: executed by bash(1) for non-login shells.
# See https://waxzce.medium.com/use-bashrc-d-directory-instead-of-bloated-bashrc-50204d5389ff.

# If not running interactively, don't do anything (https://askubuntu.com/a/1070182).
[[ $- == *i* ]] || return

# Source global definitions, if any
if [ -r /etc/bashrc ]; then
  . /etc/bashrc
fi

# Enable bash-completion.
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Source local definitions, if any
if [ -d ~/.bashrc.d ]; then
  for file in ~/.bashrc.d/*.bashrc; do
    . "$file"
  done
fi
