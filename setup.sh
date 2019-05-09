#!/usr/bin/env bash

set -eou pipefail

READLINK=$( type -p greadlink readlink | head -1 || true)
[ -n "$READLINK" ] || abort "cannot find readlink - are you missing GNU coreutils?"

resolve_link() {
  "$READLINK" "$1"
}

abs_dirname() {
  local cwd="$PWD"
  local path="$1"

  while [ -n "$path" ]; do
    cd "${path%/*}"
    local name="${path##*/}"
    path="$(resolve_link "$name" || true)"
  done

  pwd
  cd "$cwd"
}


DOTFILES_DIR=$(abs_dirname .)

# Brew detection and installation
if test ! $(which brew); then
  echo "⚒ Installing homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Set permissions right for /usr/local/*
echo "⚒ Fixing permissions for /usr/local/*"
sudo chown -R $(whoami) $(brew --prefix)/*

# Install fish first, and ensure the vendor directories exist.
if test ! $(which fish); then
  echo "⚒ Installing Fish"
  brew install fish
fi
if [ ! -d $(pkg-config --variable functionsdir fish) ]; then
  sudo mkdir -p $(pkg-config --variable functionsdir fish)
fi
if [ ! -d $(pkg-config --variable completionsdir fish) ]; then
  sudo mkdir -p $(pkg-config --variable completionsdir fish)
fi

# Link our config to where fish wants it.
if [ ! -d ~/.config/fish ]; then
  set -x
  echo "⚒ Linking Fish config"
  mkdir -p $HOME/.config
  ln -nFs "$DOTFILES_DIR/fish" $HOME/.config/fish
  set +x
fi

echo "⚒ Installing software from Brewfile"
brew tap Homebrew/bundle
brew bundle --force


echo "🐟 Setting fish as shell"
shell="/usr/local/bin/fish"

if test ! $(grep $shell /etc/shells); then
  sudo bash -c "echo $shell >> /etc/shells"
fi

if [[ ! $SHELL = $shell ]]; then
  chsh -s $shell
fi

dotfilesInstall=true fish
