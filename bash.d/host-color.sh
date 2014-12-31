# Calculate a short checksum of the real hostname to determine a unique color
if [ $(hostname) == "mordor" ]; then
  host_color="$(tput setaf 1)"
else
  if [[ $TERM =~ "256color" ]]; then
     host_color="$(tput setaf $((16 + $(hostname | cksum | cut -c2-4) % 240)))";
  else
     host_color="$(tput setaf $((31 + $(hostname | cksum | cut -c2-4) % 6)))";
  fi
fi