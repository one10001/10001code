#!bin/bash -xe 
wget https://github.com/RavenCommunity/kawpowminer/releases/download/1.2.3/kawpowminer-ubuntu18-1.2.3.zip
unzip kawpowminer-ubuntu18-1.2.3.zip
ls -la
kawpowminer -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.RIG01@s3.solopool.org:7013 -U  --cu-grid-size 128  --cu-block-size 256  --cu-parallel-hash 4
