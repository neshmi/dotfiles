# My dotfiles
These are designed around my workflows and habits.  But, they might work for you, too.

## Installation
1. Clone the repo into `~/.dotfiles`
2. `cd ~/.dotfiles`
3. Run `./setup.sh`

This will iterate through the directories and files in the `.dotfiles` directory and symlink
them into place in your home directory.

It supports both `zsh` and `bash`, my current shell is `zsh`, but I was a `bash` user for many
years.  Place any `zsh` scripts into `~/.zsh.d` and any `bash` scripts into `~/.bash.d`. Place
any scripts that can be used in both into `~/.sh.d`.

## Private Credentials
No environment would be complete without sensitive info, so stick those into `~/.private.d` and
they'll get sourced, too!
