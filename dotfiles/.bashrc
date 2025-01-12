# ~/.bashrc: executed by bash(1) for non-login shells.
# See https://waxzce.medium.com/use-bashrc-d-directory-instead-of-bloated-bashrc-50204d5389ff.

# If not running interactively, don't do anything (https://askubuntu.com/a/1070182).
[[ $- == *i* ]] || return

# Source global definitions, if any
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Source local definitions, if any
if [ -d ~/.bashrc.d ]; then
  for file in ~/.bashrc.d/*.bashrc; do
    . "$file"
  done
fi
