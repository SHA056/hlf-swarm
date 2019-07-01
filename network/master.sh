#!/bin/bash

docker swarm leave -f
ssh psq@192.168.0.119 docker swarm leave -f

sleep 5

printf "\n./setup swarm\n"
./setup_swarm.sh
sleep 5

printf "\n\n./create_network.sh\n"
./create_network.sh
sleep 5

TOKEN=$(docker swarm join-token manager | grep "docker swarm join")

ssh psq@192.168.0.119 $TOKEN
# ssh psq@192.168.0.119 
# ssh fabric@192.168.0.2 $TOKEN