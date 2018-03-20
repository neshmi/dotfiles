export GPG_TTY="$(tty)"
#export SSH_AUTH_SOCK=~/.gnupg/S.gpg-agent.ssh
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
#gpgconf --launch gpg-agent
gpg-connect-agent /bye > /dev/null 2>&1
