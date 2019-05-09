function audio-reset
  ps aux | grep 'coreaudio[d]' | awk '{print $2}' | xargs sudo kill
end
