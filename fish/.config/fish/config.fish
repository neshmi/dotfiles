set -U fish_greeting "🐟"
functions -e open # turn off Fish's open command, it's not necessary on OS X

# Add bits to path; once.
for file_path in /usr/local/sbin $HOME/bin $HOME/go/bin /opt/bcdk/bin/ /opt/homebrew/bin
  if not contains $file_path $fish_user_paths
    set -Ua fish_user_paths $file_path
  end
end

# Source private data
if test -e $HOME/.private.config.fish
  source $HOME/.private.config.fish
end

starship init fish | source
