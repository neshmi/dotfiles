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