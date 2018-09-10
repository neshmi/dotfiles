# Load rbenv if available
export PATH="$HOME/.rbenv/bin:$PATH"

if [ $commands[rbenv] ]; then
  rbenv(){
    unfunction "$0"
    eval "$(rbenv init - --no-rehash)"
    $0 "$@"
  }
fi

if [ $commands[work] ]; then
  work(){
    unfunction "$0"
    eval "$(work init -)"
    $0 "$@"
  }
fi

if [ -e ~/Work/basecamp/37 ]; then
  37(){
    unfunction "$0"
    eval "$("$HOME/Work/basecamp/37/bin/37" init -)"
    $0 "$@"
  }
fi

if [[ $- == *i* ]]; then
alias cat="bat"
alias ping="prettyping --nolegend"
alias top="htop"
alias diff="diff-so-fancy"
fi
