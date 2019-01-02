function switch_key
  for keygrip in A2C1F8652BBDA8758C6952D6800E5FCBC545175C D72C8A3123D2DE36E0867157239FD31C3A274423 7D73A3F113B9B5B1AB7626220DDA984564EC3A22
    rm ~/.gnupg/private-keys-v1.d/$keygrip.key
    gpg --card-status > /dev/null 2>&1
  end
end

set --export SSH_AUTH_SOCK $HOME/.gnupg/S.gpg-agent.ssh
