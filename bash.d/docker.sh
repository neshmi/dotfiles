function docker-stop-all(){
  if [ $(docker ps -q | wc -l) -gt 0 ]; then
    docker stop $(docker ps -q)
  fi
}


function docker-rm-containers(){
  if [ $(docker ps -a -q | wc -l) -gt 0 ]; then
    docker rm $(docker ps -a -q)
  fi
}

function docker-rm-images(){
  if [ $(docker images -q | wc -l) -gt 0 ]; then
    docker rmi $(docker images -q)
  fi
}

function docker-orphans(){
 docker images | grep '<none>' | awk '{print $3}'
}
function docker-rm-orphans(){
  if [ $(docker-orphans | wc -l) -gt 0 ]; then
    docker rmi $(docker-orphans)
  fi
}

function dsa(){
  docker-stop-all
}

function drc(){
  docker-rm-containers
}

function dri(){
  docker-rm-images
}
