HOSTNAME=$(hostname -s)


if [ ! -d ~/.zplug ]; then
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
fi

# Zplug
#source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "zsh-users/zsh-history-substring-search", defer:2
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2, at:v0.3.3
#zplug "hchbaw/auto-fu.zsh", defer:2
zplug "micha/resty", use:"resty"


# Install plugins if there are plugins that have not been installed
#if ! zplug check --verbose; then
#    printf "Install? [y/N]: "
#    if read -q; then
#        echo; zplug install
#    fi
#fi

# Then, source plugins and add commands to $PATH
#zplug load

=======
>>>>>>> 7fd86b3 (Ugh, merge detrius)
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename ~/.zshrc
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


source <(cat ~/.zsh.d/*)
source <(cat ~/.sh.d/*)

# Source private files that may contain credentials or sensitive info
if [ -d .private.d ]; then
    source <(cat ~/.private.d/*)
fi

# Prompt
setopt prompt_subst
export PS1='[%F{green}%n%f%F{white}@%f$hostname%f] %F{blue}%1~%f %# '
export RPS1='${vcs_info_msg_0_}'

# Source zsh plugins last
if [ ! -e ~/.zsh_plugins.sh ]; then
    antibody bundle < ~/.dotfiles/zsh_plugins.txt > ~/.zsh_plugins.sh
fi

source ~/.zsh_plugins.sh

ZSH_AUTOSUGGEST_STRATEGY=match_prev_cmd
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'
bindkey '^ ' autosuggest-accept