#!/bin/env bash

# Enable color support of ls.
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'
fi

# More ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
