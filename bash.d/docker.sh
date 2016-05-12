alias docker-clean-containers="docker rm $(docker ps -a -q)"
alias docker-clean-images="docker rmi $(docker images -q)"
