#!/bin/bash

docker swarm leave -f
# ssh a@192.168.1.102 docker swarm leave -f

sleep 5

printf "\n./setup swarm\n"
./setup_swarm.sh
sleep 5

printf "\n\n./create_network.sh\n"
./create_network.sh
sleep 5

# TOKEN=$(docker swarm join-token manager | grep "docker swarm join")

# ssh a@192.168.1.102 $TOKEN
# ssh a@192.168.1.102 
# ssh a@192.168.1.2 $TOKEN