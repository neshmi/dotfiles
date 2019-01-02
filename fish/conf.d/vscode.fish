function __vscode_install_extension
  yes 1 | code --install-extension $argv[1]
end

if dotfiles-is-installing
  echo "💻 Setting up VS Code"

  # Can list extensions with code --list-extensions
  __vscode_install_extension eamodio.gitlens
  __vscode_install_extension ms-vscode.csharp
  __vscode_install_extension ms-vscode.Go
  __vscode_install_extension rust-lang.rust
  __vscode_install_extension mattlott.copy-github-url
  __vscode_install_extension skyapps.fish-vscode
  __vscode_install_extension misogi.ruby-rubocop
  __vscode_install_extension castwide.solargraph
  __vscode_install_extension ccy.ayu-adaptive
  __vscode_install_extension emmanuelbeziat.vscode-great-icons
end

set --export EDITOR "code"

dotfiles-link "$HOME/.dotfiles/config/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
