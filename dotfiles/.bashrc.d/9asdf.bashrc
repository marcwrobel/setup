#!/bin/env bash

# asdf initialization.
if [ -r $HOME/.asdf/asdf.sh ]; then
  export ASDF_DIR="$HOME/.asdf"
  . $ASDF_DIR/asdf.sh
  . $ASDF_DIR/completions/asdf.bash

  # https://github.com/halcyon/asdf-java
  if [ -r $ASDF_DIR/plugins/java/set-java-home.bash ]; then
    . $ASDF_DIR/plugins/java/set-java-home.bash
  fi
fi
