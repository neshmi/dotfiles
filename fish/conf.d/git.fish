dotfiles-link "$HOME/.dotfiles/config/gitconfig" "$HOME/.gitconfig"
dotfiles-link "$HOME/.dotfiles/config/gitignore" "$HOME/.gitignore"

set --export GIT_EDITOR "vim"
set --export GITHUB_TOKEN (github-access-token)
