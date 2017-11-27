if which aws > /dev/null; then
  source /usr/local/share/zsh/site-functions/aws_zsh_completer.sh
fi

if which awless > /dev/null; then
  source <(awless completion zsh)
fi
