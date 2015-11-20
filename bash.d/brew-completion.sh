#!/bin/bash

# Set up osx-specific completions
if [[ $OSTYPE == darwin* ]] && [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
