# RDP tools
- firefox
- remotecromedesktop
- multicontainer firefox
- autokey
- python3
- atbswp = https://github.com/RMPR/atbswp
- pyautogui

https://dashboard.ngrok.com/tunnel-agents/sessions

# Python
sudo apt install -y gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget python3 python-is-python3 python3-pip python3-tk python3-dev git python3-dev python3-tk python3-setuptools python3-wheel python3-pip git python3-dev python3-tk python3-setuptools python3-wxgtk4.0  autokey-gtk autokey-common scrot zsh git python3-dev python3-tk python3-setuptools python3-wheel python3-pip python3-wxgtk4.0 xdotool curl wget

# Debian
sudo apt install -y gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc-s1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation  libnss3 lsb-release xdg-utils wget python3 python-is-python3 python3-pip python3-tk python3-dev git python3-dev python3-tk python3-setuptools python3-wheel python3-pip git python3-dev python3-tk python3-setuptools python3-wxgtk4.0  autokey-gtk autokey-common scrot zsh git python3-dev python3-tk python3-setuptools python3-wheel python3-pip python3-wxgtk4.0 xdotool curl wget

pip3 install selenium  pyautogui pynput   pytest urllib3 ushlex
pip3 install selenium
pip3 install pytest
pip3 install pyautogui 
pip3 install pynput

## install atbswp
sudo apt install git python3-dev python3-tk python3-setuptools python3-wheel python3-pip python3-wxgtk4.0 xdotool
git clone https://github.com/RMPR/atbswp.git && cd atbswp
python3 -m pip install pyautogui pynput --user
python3 atbswp/atbswp.py

## Good Cpu plans
xrcloud.com 30d free vps
cloud.ibm.com
xrcloud.

intel : https://www.intel.com/content/www/us/en/forms/idz/devcloud-enrollment/edge-request.html
        software.intel.com/content/www/us/en/develop/tools/devcloud/edge/build.html
        https://notebooks.edge.devcloud.intel.com/

gihub
circleci
bitbucket
sandbox.cs50.io
https://www.katacoda.com/
+ https://www.katacoda.com/courses/git/1
+ x2 https://www.katacoda.com/courses/docker-production/getting-started-with-swarm-mode

https://www.onworks.net/
https://www.onworks.net/runos/prepare-os.html?home=init&os=elementaryos-5.0-stable
# Good plans GPU
https://console.paperspace.com/
https://app.gpuhub.net/register?requestId=olardo
https://www.jovian.ai/  
https://jovian.ai/one10001/test
cannary gigle app
https://hub.binder.jovian.ml/user/one10001/terminals/1
https://www.kaggle.com/scratchpad/notebookf3fdf6aacf/edit
https://ide.goorm.io/       ######### block malware detection
https://www.kaggle.com/ (no network)
## get mouse position

apt install -y xdotool
"""""""""""""""""""""""""""""""""""""
while [ 1 ];
do
    m=`xdotool getmouselocation|sed 's/x:\(.*\) y:\(.*\) screen:.*/\1, \2/'`
    echo $m
    if [ "$m" = "0, 0" ];
    then
        echo "top left"
    fi
    sleep 0.3
done

""""""""""""""""""""""""""""""""""""""""""""""""


# Chrome vs firefox
"Chrome + sessionbox"  < x1.6 < "firefox + multicontainer"
Chrome 76G <=> 144 

# firefox web webdriver 
sudo apt-get install firefox=75.0+build3-0ubuntu1
OLDIR=$PWD
cd /tmp
wget -O geckodriver.tar.gz https://github.com/mozilla/geckodriver/releases/download/v0.29.1/geckodriver-v0.29.1-linux64.tar.gz
tar xzf geckodriver.tar.gz
sudo mv geckodriver /usr/bin/geckodriver
cd $OLDIR
## kill all firefox & chrome /bin/kcolab
sudo echo '#!/bin/bash' > /bin/kcolab
sudo echo 'kill -9 $(ps -x | grep firefox)' >> /bin/kcolab
sudo echo 'kill -9 $(ps -x | grep chrome/chrome)' >> /bin/kcolab
sudo chmod +x /bin/kcolab


# Docker
## clean contaners:
docker container stop $(docker ps -a -q)
docker container rm $(docker ps -a -q) 
docker volume prune


# edge linux
## Setup
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-beta.list'
sudo rm microsoft.gpg
## Install
sudo apt update
sudo apt install microsoft-edge-beta -y


# mode header selinium https://github.com/bewisse/modheader_selenium
npm install firefox-modheader
