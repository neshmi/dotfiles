set -U fish_greeting "🐟"

# Add bits to path; once.
for file_path in /usr/local/sbin $HOME/bin $HOME/go/bin /opt/homebrew/bin
  if not contains $file_path $fish_user_paths
    set -Ua fish_user_paths $file_path
  end
end

# Source private data like credentials or work-related stuff
if test -e $HOME/.private.config.fish
  source $HOME/.private.config.fish
end

starship init fish | source
