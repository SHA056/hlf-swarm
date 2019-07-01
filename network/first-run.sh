#!/bin/bash

set -e

cd /home/psq/blockchain/hlf-swarm/network

printf "\n\n"
printf "******************************************************************************************************************************************************\n"
printf "**********************************************************************START CLEANUP*******************************************************************\n"
printf "******************************************************************************************************************************************************\n"

printf "\nCleaning up host machine\n"
./cleanupFabric.sh
printf "\nCleaning up Org3 machine\n"
./cleanupOrg3.sh

printf "\n\n"
printf "******************************************************************************************************************************************************\n"
printf "*****************************************************************STARTING APPLICATION*****************************************************************\n"
printf "******************************************************************************************************************************************************\n"

# printf "./setup_swarm.sh"
# ./setup_swarm.sh

# sleep 5

# printf "./create_network.sh"
# ./create_network.sh

printf "\n./master.sh\n"
./master.sh

sleep 5

printf "\n./move_crypto.sh\n"
./move_crypto.sh
printf "\n./move_cryptoOrg3.sh\n"
./move_cryptoOrg3.sh

sleep 10

printf "\n./populate_hostname.sh"
./populate_hostname.sh

sleep 5

printf "\n./start_all.sh"
./start_all.sh

sleep 5

# printf "\ndocker service ls | grep \"0/1\""
# docker service ls | grep "0/1"

printf "\nServices at host node"
docker service ls
printf "\nServices at Org3 node"
ssh psq@192.168.0.119 docker service ls

sleep 5

printf "\nCli container"
docker service ps $(docker service ls | grep cli | awk '{print $2}')

sleep 30

printf "\n./scripts/create_channel.sh\n"
./scripts/create_channel.sh

sleep 5

printf "\n./scripts/install_chaincodes.sh\n"
./scripts/install_chaincodes.sh

printf "\n"
printf "\n\n"
printf "******************************************************************************************************************************************************\n"
printf "*******************************************************************SETUP COMPLETED********************************************************************\n"
printf "******************************************************************************************************************************************************\n"


