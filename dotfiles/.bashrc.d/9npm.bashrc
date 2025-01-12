#!/bin/env bash

# Configure NPM to install packages globally without sudo.
# See https://github.com/sindresorhus/guides/blob/main/npm-global-without-sudo.md.
if command -v npm &> /dev/null; then
  NPM_PACKAGES="${HOME}/.npm-packages"
  export npm_config_prefix="${NPM_PACKAGES}"
  export PATH="$PATH:$NPM_PACKAGES/bin"
  export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
fi


