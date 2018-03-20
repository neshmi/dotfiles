# Load rbenv if available
load_rbenv(){
  if [ -d ~/.rbenv ]; then
      export PATH="$HOME/.rbenv/bin:$PATH"
      eval "$(rbenv init - --no-rehash)"
  fi
}

# Source work
load_work() {
  which work >/dev/null 2>&1 && eval "$(work init -)"
}

load_slow(){
  load_rbenv
  load_work
}