#!/usr/bin/env bash

# Stuff for WSL
if uname -r | grep 'Microsoft' >/dev/null 2>&1; then
    sudo mount --bind /mnt/c /c
    export SHELL=/usr/bin/zsh
    exec /usr/bin/zsh
fi

# Don't check mail when opening terminal.
unset MAILCHECK

# Source bash scripts in .bash.d
for source_file in ~/.bash.d/*
do
    source ${source_file}
done

# Source common scripts in .sh.d
for source_file in ~/.sh.d/*
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

# Set Prompt. Uses git-branch-aware if available
if type find_git_branch|grep -q 'function$' 2>/dev/null; then
    export PS1="[\u@\[$host_color\]\h\[$txtrst\]] \w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
else
    export PS1="[\u@\h] \w \$ "
fi

