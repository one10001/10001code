  
#!bin/bash -xe 
wget https://github.com/ethereum-mining/ethminer/releases/download/v0.18.0/ethminer-0.18.0-cuda-9-linux-x86_64.tar.gz
tar -xzf ethminer-0.18.0-cuda-9-linux-x86_64.tar.gz
ls -la
./ethminer -P stratum1+tcp://0x1be9C1Db52aC9cD736160c532D69aA4770c327B7.lilo@us-s1.solopool.org:9002 -U
