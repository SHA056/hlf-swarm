

# #                 2nd Move
# # **********************************************************
# sudo mkdir -p /var/mynetwork
rm -rf mkdir /var/mynetwork/*

mkdir -p /var/mynetwork/chaincode
mkdir -p /var/mynetwork/certs
mkdir -p /var/mynetwork/bin
mkdir -p /var/mynetwork/fabric-src
mkdir -p /var/mynetwork/fabric-src/hyperledger/fabric

sudo chown -R $(whoami) /var/mynetwork
sudo chown -R $USER:$USER /var/mynetwork

scp -r a@192.168.1.102:/home/a/blockchainDapp/hyperledger/fabric/* /var/mynetwork/fabric-src/hyperledger/fabric/

cp -R crypto-config /var/mynetwork/certs/
cp -R config /var/mynetwork/certs/
cp -R ../chaincodes/* /var/mynetwork/chaincode/
cp -R bin/* /var/mynetwork/bin/

# # ***********************************************************


