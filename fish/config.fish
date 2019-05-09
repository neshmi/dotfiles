set fish_greeting # turn off greeting
functions -e open # turn off Fish's open command, it's not necessary on OS X

set PATH $PATH /usr/local/sbin

if dotfiles-is-installing
  echo "💻 Decrypting secrets"

  if not test -e $HOME/.private.config.fish
    if test -e "$HOME/Library/Mobile Documents/com~apple~CloudDocs/config.fish.enc"
      decrypt_file "$HOME/Library/Mobile Documents/com~apple~CloudDocs/config.fish.enc" $HOME/.private.config.fish 1
    else
      echo "Encrypted file not found!"
    end
  end
end

if test -e $HOME/.private.config.fish
  source $HOME/.private.config.fish
end