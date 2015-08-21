opendir(){
  if [ -d "$1" ]; then
    chmod -R go+r "$1"
    find "$1" -type d -execdir /bin/chmod go+x {} \;
  fi
}
