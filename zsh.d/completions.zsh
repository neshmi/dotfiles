#if which aws > /dev/null; then
#  source ~/.local/bin/aws_zsh_completer.sh
#fi
if [ -e ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
    ZSH_AUTOSUGGEST_STRATEGY=match_prev_cmd
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'
    bindkey '\t' autosuggest-accept
fi
