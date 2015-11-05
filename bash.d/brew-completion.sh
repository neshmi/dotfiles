#!/bin/bash

if [ "$(which brew)x" != "x" ] && [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
