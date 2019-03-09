dotfiles-link "$HOME/.dotfiles/config/gitconfig" "$HOME/.gitconfig"
dotfiles-link "$HOME/.dotfiles/config/gitignore" "$HOME/.gitignore"

set --export GIT_EDITOR "vi"
set --export GITHUB_TOKEN (github-access-token)
