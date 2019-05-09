if dotfiles-is-installing
  if not test -f ~/.cargo/bin/rustup
    echo "🔧 Installing rust"
    echo
    curl https://sh.rustup.rs -sSf > /tmp/rust-install
    chmod +x /tmp/rust-install
    /tmp/rust-install -y 2>&1
    rm /tmp/rust-install
    echo
  else
    echo "🔧 Rust already installed"
  end
end

source ~/.cargo/env