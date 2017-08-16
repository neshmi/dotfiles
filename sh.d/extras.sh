# Load rbenv if available
if [ -d ~/.rbenv ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

# Source oh-my-git if it exists
if [ -f ~/.oh-my-git ]; then
  source ~/.oh-my-git/prompt.sh
fi

# Source work
which work >/dev/null 2>&1 && eval "$(work init -)"
