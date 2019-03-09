if dotfiles-is-installing
  echo "💎 Setting up rbenv"
  set rubyVersion "2.6.1"

  mkdir -p ~/.rbenv
  echo "bundler" > ~/.rbenv/default-gems
  rbenv install $rubyVersion --skip-existing
  rbenv global $rubyVersion
end

dotfiles-link $HOME/.dotfiles/config/irbrc $HOME/.irbrc

set --export BUNDLE_PATH ".bundle/gems"
set --export BUNDLE_BIN  ".bundle/bin"
set --export BUNDLER_EDITOR "code --add"
set --export UNSPRUNG 1

set PATH $HOME/.rbenv/shims $PATH
set PATH ./.bundle/../bin $BUNDLE_BIN $PATH

abbr --add bi bundle install