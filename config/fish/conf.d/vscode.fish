function __vscode_install_extension
  yes 1 | code --install-extension $argv[1]
end

if dotfiles-is-installing
  echo "💻 Setting up VS Code"

  # Can list extensions with code --list-extensions
  __vscode_install_extension anseki.vscode-color
  __vscode_install_extension qinjia.seti-icons
  __vscode_install_extension eamodio.gitlens
  __vscode_install_extension file-icons.file-icons
  __vscode_install_extension ms-vscode.Go
  __vscode_install_extension idleberg.hopscotch
  __vscode_install_extension rust-lang.rust
  __vscode_install_extension mauve.terraform
  __vscode_install_extension mattlott.copy-github-url
  __vscode_install_extension skyapps.fish-vscode
end

set --export EDITOR "code"

dotfiles-link "$HOME/.dotfiles/config/vscode/settings.json"    "$HOME/Library/Application Support/Code/User/settings.json"
