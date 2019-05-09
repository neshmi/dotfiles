function encrypt_file
  set -l infile $argv[1]
  set -l outfile $argv[2]

  set -q outfile[1]; or set -l outfile "$infile.enc"
  openssl enc -aes-256-cbc -salt -in $infile -out $outfile
end