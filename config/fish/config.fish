set fish_greeting # turn off greeting
functions -e open # turn off Fish's open command, it's not necessary on OS X

set PATH $PATH /usr/local/sbin

if test -e $HOME/.private.d/config.fish
  source $HOME/.private.d/config.fish
end