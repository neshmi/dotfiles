function github-access-token
  if is_linux
    echo "not-set"
  else
    printf "host=github.com\nprotocol=https\n\n" | git credential-osxkeychain get | grep password= | string replace "password=" ""
  end
end

