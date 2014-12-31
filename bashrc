#!/usr/bin/env bash

# OS X has a ridiculously low ulimit
ulimit -n 10240

# Don't check mail when opening terminal.
unset MAILCHECK

# Add local bin and ~/bin to the path
export PATH=/usr/local/bin:$PATH:~/bin

# Source bash scripts in .bash.d
for source_file in ~/.bash.d/*
do
    source ${source_file}
done

# Source private files that may contain credentials or sensitive info
if [ -d .private.d ]; then
    for private in ~/\.private.d/*
    do
        source ${private}
    done
fi

### Aliases
alias c="script/console"
alias e="vi ."

### Variables
# Change this to your console based IRC client of choice.
export IRC_CLIENT='weechat'

# Ruby default options
export RUBYOPT="-Ilib -Itest -rubygems"

# History Control
export HISTTIMEFORMAT="%F %T "
export HISTCONTROL="ignoreboth"
export HISTFILESIZE=1000000
export HISTSIZE=100000

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@github.com'

# Set my editor and git editor
export EDITOR="/usr/bin/vim"
export GIT_EDITOR='/usr/bin/vim'
export ANSIBLE_HOSTS=~/etc/ansible_hosts

# Set Prompt. Uses git-branch-aware if available
if type find_git_branch|grep -q 'function$' 2>/dev/null; then
    export PS1="[\u@\[$txtred\]\h\[$txtrst\]] \w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
else
    export PS1="[\u@\h] \w \$ "
fi

# Set up osx-specific build options
if [[ $OSTYPE == darwin* ]]; then
    export PATH=$PATH:/usr/local/sbin
    export C_INCLUDE_PATH="$(xcrun --show-sdk-path)/usr/include"
    export CPLUS_INCLUDE_PATH="$(xcrun --show-sdk-path)/usr/include"
    export LIBRARY_PATH="$(xcrun --show-sdk-path)/usr/lib:$(xcrun --show-sdk-path)/usr/lib/system:$LIBRARY_PATH"
fi

# Load rbenv if available
if [ -d ~/.rbenv ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi
