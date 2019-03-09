if dotfiles-is-installing
  if not test -f /usr/local/bin/go
    echo "🔧 Installing golang"
    echo
    brew install golang
    echo
  else
    echo "🔧 golang already installed"
  end
  contains ~/go/bin $PATH; or set PATH $PATH ~/go/bin
end
