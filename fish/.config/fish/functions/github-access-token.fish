function github-access-token
  if is_linux
    echo "foo"
  else
    printf "host=github.com\nprotocol=https\n\n" | git credential-osxkeychain get | grep password= | string replace "password=" ""
  end
end

