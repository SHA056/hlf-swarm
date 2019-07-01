#!/bin/bash

set -e

# Exit on first error

#deletes admin/user certificates
printf "\nRemoving related certificates...\n"
printf "rm -rf ~/Library/Containers/com.docker.docker/Data/* \n"
printf "rm -rf /root/.hfc-key-store\n\n"
rm -rf ~/Library/Containers/com.docker.docker/Data/*
rm -rf /root/.hfc-key-store

# Shut down the Docker containers and services.
docker service rm $(docker service ls -q)
docker rm -f $(docker ps -aq)

# remove chaincode docker images
docker rmi -f $(docker images | grep samahara | awk '{print $3}')

# clean up dangling network and volumes
docker system prune
docker volume prune
docker swarm leave -f
docker network prune
