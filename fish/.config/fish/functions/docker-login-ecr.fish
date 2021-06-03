function docker-login-ecr
  set -l profile $argv[1]
  # Gate function on aws
  if which aws > /dev/null
    set -l region (aws configure get region --profile $profile)
    set -l account (aws sts get-caller-identity --profile $profile |jq -r '.Account')
    aws ecr get-login-password --profile $profile | docker login --username AWS --password-stdin https://$account.dkr.ecr.$region.amazonaws.com
  end
end
