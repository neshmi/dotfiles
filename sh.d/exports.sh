### Variables
# Change this to your console based IRC client of choice.
export IRC_CLIENT='weechat'

# History Control
export HISTTIMEFORMAT="%F %T "
export HISTCONTROL="ignoreboth"
export HISTFILESIZE=10000000
export HISTSIZE=10000000
export SAVEHIST=$HISTSIZE

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@github.com'

# Set my editor and git editor
export EDITOR="/usr/bin/vim"
export GIT_EDITOR='/usr/bin/vim'

# Set up osx-specific build options
if [[ $OSTYPE == darwin* ]]; then
    export PATH=$PATH:/usr/local/sbin
    export C_INCLUDE_PATH="$(xcrun --show-sdk-path)/usr/include"
    export CPLUS_INCLUDE_PATH="$(xcrun --show-sdk-path)/usr/include"
    export LIBRARY_PATH="$(xcrun --show-sdk-path)/usr/lib:$(xcrun --show-sdk-path)/usr/lib/system:$LIBRARY_PATH"
    # OS X has a ridiculously low ulimit
    ulimit -n 10240
fi

# Setup terminal, and turn on colors
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
export ARCHFLAGS='-arch x86_64'

export EDITOR='code -w'

export HOMEBREW_NO_ANALYTICS=1

# Add local bin and ~/bin to the path
export PATH=/usr/local/bin:$PATH:~/bin
