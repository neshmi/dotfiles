# Load rbenv if available
if [ -d ~/.rbenv ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

# Load orc if available
# https://github.com/anoldguy/orc ;)
if [ -d ~/.orc ]; then
    eval "$(~/.orc/bin/orc init -)"
fi

# Source oh-my-git if it exists
if [ -f ~/.oh-my-git ]; then
  source ~/.oh-my-git/prompt.sh
fi
