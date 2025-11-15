#!/bin/env bash

# asdf initialization.
if [ -x $HOME/bin/asdf ]; then
  export ASDF_DATA_DIR="$HOME/.asdf"
  export PATH="$ASDF_DATA_DIR/shims:$PATH"
  . <(asdf completion bash)

  # https://github.com/halcyon/asdf-java
  if [ -r $ASDF_DIR/plugins/java/set-java-home.bash ]; then
    . $ASDF_DIR/plugins/java/set-java-home.bash
  fi
fi
