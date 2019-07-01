#!/bin/bash

set -e

# Exit on first error

sleep 5

cd /home/psq/blockchain/hlf-swarm/network

#remove crypro files
printf "\n"
printf "....Searching for remainant cert files...."
printf "\n\n"
ls /var/mynetwork/certs 
if [ $? -ne 0 ]; then
    rm -rf /var/mynetwork/certs
    printf "All cert files deleted"
else
    printf "No cert files\n\n"
fi

# remove docker containers
printf "\n"
printf "....Searching for unrequired docker containers...."
printf "\n\n"
docker ps -aq
if [ $? -ne 0 ]; then
    docker rm -f $(docker ps -aq)
    printf "All docker containers deleted"
else
    printf "No docker containers\n\n"
fi

# remove chaincode docker images
printf "\n"
printf "....Searching for unrequired docker images...."
printf "\n\n"
docker images | grep samahara | awk '{printf $3}'
if [ $? -ne 0 ]; then
    docker rmi -f $(docker images | grep samahara | awk '{print $3}')
    printf "All related images deleted"
else
    printf "No related images\n\n"
fi

printf "\n"
printf "....Cleaning dangling network and volumes...."
printf "\n\n"

docker system prune
docker volume prune