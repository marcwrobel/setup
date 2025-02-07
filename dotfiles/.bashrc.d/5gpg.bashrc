#!/bin/env bash

# gpg configuration.
if [ -x /usr/bin/gpgconf ]; then
  export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  gpgconf --launch gpg-agent
fi
