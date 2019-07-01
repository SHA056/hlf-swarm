
# # #                 Refresh
# # # **********************************************************

# ssh psq@192.168.0.119 rm -rf mkdir /var/mynetwork/chaincode
# ssh psq@192.168.0.119 rm -rf mkdir /var/mynetwork/certs

# ssh psq@192.168.0.119 mkdir -p /var/mynetwork/chaincode
# ssh psq@192.168.0.119 mkdir -p /var/mynetwork/certs


# cd /home/psq/blockchain/hlf-swarm/network

# scp -r ../chaincodes/* psq@192.168.0.119:/var/mynetwork/chaincode/
# scp -r crypto-config psq@192.168.0.119:/var/mynetwork/certs/
# scp -r config psq@192.168.0.119:/var/mynetwork/certs/
# # # **********************************************************



# #                 First Run
# # **********************************************************
# sudo mkdir -p /var/mynetwork
# sudo chown -R $(whoami) /var/mynetwork
# sudo chown -R $USER:$USER /var/mynetwork

sudo scp -r /home/psq/blockchain/hlf-swarm  psq@192.168.0.119:/home/psq/blockchain/hlf-swarm

ssh psq@192.168.0.119 sudo chmod -R 777 /var/mynetwork

ssh psq@192.168.0.119 rm -rf mkdir /var/mynetwork/*

ssh psq@192.168.0.119 mkdir -p /var/mynetwork/chaincode
ssh psq@192.168.0.119 mkdir -p /var/mynetwork/certs
ssh psq@192.168.0.119 mkdir -p /var/mynetwork/bin
ssh psq@192.168.0.119 mkdir -p /var/mynetwork/fabric-src

scp -r /var/mynetwork/fabric-src/hyperledger/fabric psq@192.168.0.119:/var/mynetwork/fabric-src/hyperledger/fabric

cd /home/psq/blockchain/hlf-swarm/network

scp -r crypto-config psq@192.168.0.119:/var/mynetwork/certs/
scp -r config psq@192.168.0.119:/var/mynetwork/certs/
scp -r ../chaincodes/* psq@192.168.0.119:/var/mynetwork/chaincode/
scp -r bin/* psq@192.168.0.119:/var/mynetwork/bin/
# # ***********************************************************


