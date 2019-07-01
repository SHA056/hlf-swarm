#!/bin/bash

ENV_LOCATION=$PWD/.env
echo $ENV_LOCATION
source $ENV_LOCATION

docker network create --driver overlay --subnet=10.200.1.0/24 --attachable "$NETWORK_NAME"


printf "\n"
printf "\n docker services running"
# printf "docker service rm $(docker service ls -q)"
printf "\n\n"

(docker service ls -q)
if [ $? -ne 0 ]; then
    docker service rm $(docker service ls -q)
    printf "All docker services deleted"
else 
    printf "No active docker services\n\n"
fi
