#!/bin/bash

set -e

# Exit on first error

sleep 10


#remove crypro files
printf "\n"
printf "....Searching for remainant cert files in Org3...."
printf "\n\n"
 ssh psq@192.168.0.119 ls /var/mynetwork/certs 
if [ $? -ne 0 ]; then
     ssh psq@192.168.0.119 rm -rf /var/mynetwork/certs
    printf "All cert files deleted"
else
    printf "No cert files\n\n"
fi

# remove docker containers
printf "\n"
printf "....Searching for unrequired docker containers in Org3...."
printf "\n\n"
ssh psq@192.168.0.119 docker ps -aq
if [ $? -ne 0 ]; then
    ssh psq@192.168.0.119 docker rm -f $(ssh psq@192.168.0.119 docker ps -aq)
    printf "All docker containers deleted"
else
    printf "No docker containers\n\n"
fi

# remove chaincode docker images
printf "\n"
printf "....Searching for unrequired docker images in Org3...."
printf "\n\n"
ssh psq@192.168.0.119 docker images | grep samahara | awk '{printf $3}'
if [ $? -ne 0 ]; then
    ssh psq@192.168.0.119 docker rmi -f $(ssh psq@192.168.0.119 docker images | grep samahara | awk '{print $3}')
    printf "All related images deleted"
else
    printf "No related images\n\n"
fi

printf "\n"
printf "....Cleaning dangling network and volumes in Org3...."
printf "\n\n"

ssh psq@192.168.0.119 docker system prune
ssh psq@192.168.0.119 docker volume prune