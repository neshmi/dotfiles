function wtf-audio
  sudo launchctl unload /System/Library/LaunchDaemons/com.apple.audio.coreaudiod.plist
  sudo launchctl load /System/Library/LaunchDaemons/com.apple.audio.coreaudiod.plist
end