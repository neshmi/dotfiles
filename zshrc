# Start tmux or attach to existing tmux session
HOSTNAME=$(hostname -s)

# Zplug
source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "zsh-users/zsh-history-substring-search", defer:2
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2, at:v0.3.3
zplug "hchbaw/auto-fu.zsh", defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename '/Users/nathan/.zshrc'
autoload -Uz compinit
compinit
bindkey -v


# Set the language if it wasn't already set
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# Load vcs_info for git information
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
precmd() {
    vcs_info
}
zstyle ':vcs_info:git*' formats "%{$fg[blue]%}%b%{$reset_color%}%m%u%c%{$reset_color%} "
zstyle ':vcs_info:*:*' check-for-changes true
zstyle ':vcs_info:*:*' unstagedstr '%F{red} ●%f'
zstyle ':vcs_info:*:*' stagedstr '%F{green} ✚%f'

if zplug check zsh-users/zsh-autosuggestions; then
  ZSH_AUTOSUGGEST_STRATEGY=match_prev_cmd
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'
  bindkey '^ ' autosuggest-accept
fi

# Source common scripts
for source_file in ~/.sh.d/* ~/.zsh.d/*
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

# Prompt
setopt prompt_subst
export PS1='[%F{green}%n%f%F{white}@%f$hostname%f] %F{blue}%1~%f %# '
export RPS1='${vcs_info_msg_0_}'
