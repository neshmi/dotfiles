#!/bin/bash
set -eo pipefail

if [ ! -d ~/.zplug ]; then
  #curl -sL zplug.sh/installer | zsh
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
fi


TARGET="$HOME"
mkdir -p $TARGET
cat /dev/null > ~/.includes.sh
for file in *
do
  echo -n "Processing $file"
  case $file in
      # Skip setup files
      setup.sh|flat-colors.json|flat.terminal|osx.sh|sublime.prefs|apply_colors.sh|fonts)
        echo "      skipped"
        ;;
      *)
        if [ ! -d $file ]; then
          # It's just a file, link it

              # Clean up the link to the directory
              #if [ -d ${file} ]; then
              #  if [ -d ~/.${file} ]; then
              #    rm ~/.${file}
              #  fi
              #fi
              # Link the new one in place
              ln -sf $(pwd)/${file} $TARGET/.${file}
              echo "      linked"

        else
          # It's a directory, let's concatenate the contents
          base=$(basename -s.d ${file})
          cat ${file}/* > $TARGET/.${file}.$base
          echo "      compiled"
        fi
      ;;
    esac
done
