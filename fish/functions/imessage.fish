function imessage
  set -l recipient $argv[1]
  set -l message $argv[2]
  set -l OSA_SCRIPT "$HOME/bin/scripts/imessage.scpt"
  set -q recipient[1]; or set recipient "andnat@gmail.com"
  set -q message[1]; or set message "Test message from fish"

  echo "Texting '$message' to '$recipient'"
  osascript "$OSA_SCRIPT" "$recipient" "$message"
end