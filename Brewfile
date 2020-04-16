def mojave?
  `sw_vers`.match /\s10\.14/
end

tap "basecamp/private", "git@github.com:basecamp/homebrew-private.git"

cask_args appdir: "/Applications"

# FISH!
brew "fish"

# Core utils
brew "git"
brew "gnupg"
brew "pinentry-mac"
brew "awscli"
brew "jq"
brew "curl"
brew "wget"
brew "httpie"
brew "readline"

# Work stuff
brew "37"
brew "work"
brew "mysql", restart_service: :changed
brew "postgresql", restart_service: :changed
brew "redis", restart_service: :changed

# Language stuff
brew "rbenv"
brew "rbenv-default-gems"
brew "ruby-build"
brew "ant"
cask "java"
brew "go"
brew "typescript"
brew "python"
brew "node"
brew "yarn"

# Shell utilities
brew "prettyping"
brew "bat"
brew "diff-so-fancy"
brew "hub"
brew "jsonpp"
brew "ripgrep"
brew "tldr"
brew "tree"

# Personal Stuff
brew "wireguard-tools"
brew "youtube-dl"
brew "flac"
brew "libdvdread"
brew "mkvtoolnix"

# MacOS Apps
cask "1password"
cask "1password-cli"
cask "spotify"
cask "visual-studio-code"
cask "encryptme"
cask "docker"
cask "viscosity"
cask "sketch"
cask "makemkv"
cask "firefox"
cask "gifox"
cask "spectacle"
cask "keybase"
cask "github"
cask "google-cloud-sdk"
cask "signal"
cask "steam"
cask "yacreader"
cask "xld"
cask "iterm2"
cask "steam"
cask "google-chrome"
cask "zoom"
cask "whatsapp"

# Fonts
tap "homebrew/cask-fonts"

cask "font-source-code-pro"
cask "font-mononoki-nerd-font"
