if which aws > /dev/null; then
  source /usr/local/bin/aws_zsh_completer.sh
fi

if which awless > /dev/null; then
  source <(awless completion zsh)
fi
