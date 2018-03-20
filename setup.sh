#!/bin/bash
set -eo pipefail

if [ ! -d ~/.zplug ]; then
  #curl -sL zplug.sh/installer | zsh
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
fi

for file in *
do
  echo -n "Processing $file"
  #if [ ! -d $file ]; then
    # It's just a file, link it
    case $file in
      # Skip setup files
      setup.sh|flat-colors.json|flat.terminal|osx.sh|sublime.prefs|apply_colors.sh)
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
        ln -sf $(pwd)/${file} ~/.${file}
        echo "      linked"
        ;;
    esac
    shift
  done

  return 0
}

check_dependencies(){
 which stow > /dev/null || (echo "GNU Stow required; install via brew or apt"; exit)
 which starship > /dev/null || echo "Starship suggested; install via brew or apt"
 which fish > /dev/null || echo "fish suggested; install via brew or apt"
}

check_dependencies
parse_params "$@"
setup_colors

for dir in ./*/; do
  package=$(basename "$dir")

  if [ "$cleanup" != "" ]; then
    msg "Cleaning up ${CYAN}$package${NOCOLOR}"
    stow $force $cleanup -t ~ $verbose $package
  else
    msg "Setting up ${CYAN}$package${NOCOLOR}"
    stow $force -t ~ $verbose $package
  fi
done