export IS_LINUX=0
export IS_MAC=0
export IS_WIN=0
export HAS_BREW=0
export HAS_APT=0
export HAS_YUM=0

# checks (stolen from zshuery)
if [[ $(uname) = 'Linux' ]]; then
    IS_LINUX=1
fi

if [[ $(uname) = 'Darwin' ]]; then
    IS_MAC=1
fi

if uname -r | grep 'Microsoft' >/dev/null 2>&1; then
    IS_WIN=1
fi

if [[ -x `which brew` ]]; then
    HAS_BREW=1
fi

if [[ -x `which apt-get` ]]; then
    HAS_APT=1
fi

if [[ -x `which yum` ]]; then
    HAS_YUM=1
fi
