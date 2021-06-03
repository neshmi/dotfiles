if is_wsl
    set -x cloud_home "/mnt/c/Users/andna/iCloudDrive"
    set -x dotfiles_dir "$cloud_home/dotfiles"
else if is_linux
    set -x cloud_home "$HOME/fake_cloud"
    set -x dotfiles_dir "$HOME/.dotfiles"
else
    set -x cloud_home "$HOME/Library/Mobile Documents/com~apple~CloudDocs"
    set -x dotfiles_dir "$cloud_home/dotfiles"
end
