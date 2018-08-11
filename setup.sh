#!/bin/bash
set -eo pipefail

TARGET="$HOME"
mkdir -p $TARGET
cat /dev/null > ~/.includes.sh
for file in *
do
  echo -n "Processing $file"
  case $file in
      # Skip setup files
      setup.sh|README.md|flat-colors.json|flat.terminal|osx.sh|sublime.prefs|apply_colors.sh|fonts|zsh_plugins.txt)
        echo "      skipped"
        ;;
      *)
        # Clean up the link to the directory
        if [ -d ${file} ]; then
          if [ -d ~/.${file} ]; then
            rm ~/.${file}
          fi
        fi
        # Link the new one in place
        ln -sf $(pwd)/${file} $TARGET/.${file}
        echo "      linked"
      ;;
    esac
done

which antibody && antibody bundle < ./zsh_plugins.txt > ~/.zsh_plugins.sh
