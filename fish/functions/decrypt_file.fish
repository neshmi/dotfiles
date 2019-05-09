function decrypt_file
  set -l infile $argv[1]
  set -l outfile $argv[2]
  set -l read_password $argv[3]

  set -q outfile[1]; or set -l outfile (basename $infile .enc)
  if set -q read_password
    openssl enc -aes-256-cbc -d -in $infile -out $outfile -pass pass:(read -s -P (set_color red)"Decrypting Private Data> ")
  else
    openssl enc -aes-256-cbc -d -in $infile -out $outfile
  end
end