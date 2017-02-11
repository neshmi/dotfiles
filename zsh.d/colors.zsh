autoload colors; colors

# The variables are wrapped in %{%}. This should be the case for every
# variable that does not contain space.
#for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
#  eval PR_$COLOR='%{$fg_no_bold[${(L)COLOR}]%}'
#  eval PR_BOLD_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
#done

#eval RESET='$reset_color'
#export PR_RED PR_GREEN PR_YELLOW PR_BLUE PR_WHITE PR_BLACK
#export PR_BOLD_RED PR_BOLD_GREEN PR_BOLD_YELLOW PR_BOLD_BLUE
#export PR_BOLD_WHITE PR_BOLD_BLACK

# Clear LSCOLORS
unset LSCOLORS
export CLICOLOR=1
export LS_COLORS=exfxcxdxbxegedabagacad

# Calculate a short checksum of the real hostname to determine a unique color
# local hostname will get red by default
function hostname_with_color(){
  local host=$(hostname)
  local hostsum=$(echo $host | cksum | cut -c3-5)
  local color="red"
  if [[ "$host" != "eriador" ]] && [[ "$host" != "angband" ]]; then
    if [[ "$TERM" =~ 256color ]]; then
      color=$(( $hostsum % 256 ))
    else
      color=$(( 31 + $(echo $hostsum) % 6))
    fi
  fi
  echo "%B%F{$color}$host%b%f"
}

export hostname=$(hostname_with_color)
