
if [ -e ~/.zsh.d/zsh-autosuggestions.zsh ]; then
    source ~/.zsh.d/zsh-autosuggestions.zsh
    ZSH_AUTOSUGGEST_STRATEGY=match_prev_cmd
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'
    bindkey '\t' autosuggest-accept
fi

if [ -e ~/.zsh.d/zsh-history-substring-search.zsh ]; then
    source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
