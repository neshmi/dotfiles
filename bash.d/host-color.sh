# Calculate a short checksum of the real hostname to determine a unique color
if [ $(hostname) == "mordor" ]; then
  host_color="$(tput setaf 1)"
else
  if [[ $TERM =~ "256color" ]]; then
    # The weird '10#' in front of the hostname forces the number to be
    # interpreted as base10, not octal.
    host_color="$(tput setaf $((16 + 10#$(hostname | cksum | cut -c2-4) % 256)))";
  else
    host_color="$(tput setaf $((31 + 10#$(hostname | cksum | cut -c2-4) % 6)))";
  fi
fi
