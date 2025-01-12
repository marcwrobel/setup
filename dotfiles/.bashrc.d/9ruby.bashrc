#!/bin/env bash

# Configure RubyGems to install packages globally without sudo
# See https://jekyllrb.com/docs/installation/ubuntu/.
if command -v gem &> /dev/null; then
  export GEM_HOME="$HOME/.gems"
  export PATH="$HOME/.gems/bin:$PATH"
fi
