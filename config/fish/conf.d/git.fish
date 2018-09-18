dotfiles-link "$HOME/.dotfiles/config/gitconfig" "$HOME/.gitconfig"
dotfiles-link "$HOME/.dotfiles/config/gitignore" "$HOME/.gitignore"

set --export GIT_EDITOR "code --wait --new-window"
set --export GITHUB_TOKEN (github-access-token)
