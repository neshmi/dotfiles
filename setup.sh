#!/usr/bin/env bash

set -eou pipefail

# Brew detection and installation
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap Homebrew/bundle
brew bundle --force

mkdir -p ~/.config/fish
ln -nFs ~/.dotfiles/fish/config.fish $HOME/.config/fish/config.fish
ln -nFs ~/.dotfiles/fish/conf.d      $HOME/.config/fish/conf.d
ln -nFs ~/.dotfiles/fish/functions   $HOME/.config/fish/functions
ln -nFs ~/.dotfiles/fish/completions   $HOME/.config/fish/completions

shell="/usr/local/bin/fish"

if test ! $(grep $shell /etc/shells); then
  sudo bash -c "echo $shell >> /etc/shells"
fi

if [[ ! $SHELL = $shell ]]; then
  chsh -s $shell
fi

dotfilesInstall=true fish
