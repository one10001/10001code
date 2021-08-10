
#!/bin/bash
echo 
echo -e '####################################################################################'
echo -e '##################         '"RDP"' Ver:0.8.9        ################################'
echo -e '####################################################################################'
echo 
echo 
echo 

######################### RDP #####################################
printf "ENJOY YOURSELF & BE PATIENT... - from one" >&2
{
sudo useradd -m one
sudo adduser one sudo
echo 'one:8426' | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd

sudo apt-get update
sudo apt install -y gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget python3 python-is-python3 python3-pip python3-tk python3-dev git python3-dev python3-tk python3-setuptools python3-wheel python3-pip git python3-dev python3-tk python3-setuptools python3-wxgtk4.0  autokey-gtk autokey-common scrot zsh git python3-dev python3-tk python3-setuptools python3-wheel python3-pip python3-wxgtk4.0 xdotool curl wget
pip3 install selenium  pyautogui pynput   pytest
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg --install chrome-remote-desktop_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo DEBIAN_FRONTEND=noninteractive \
apt install --assume-yes xfce4 desktop-base
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session' 
echo "export CHROME_REMOTE_DESKTOP_DEFAULT_DESKTOP_SIZES=1366×768,1920×1080"   >> /home/one/.profile 
sudo sed -i 's+DEFAULT_SIZES = \"1600x1200,3840x2560\"+DEFAULT_SIZES = \"1366x768,1920x1080\"+g'  /opt/google/chrome-remote-desktop/chrome-remote-desktop
sudo apt install --assume-yes xscreensaver
sudo systemctl disable lightdm.service
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg --install google-chrome-stable_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo apt install nautilus nano -y 
sudo apt -y install obs-studio
sudo apt -y install firefox zsh
sudo adduser one chrome-remote-desktop
} &> /dev/null &&
printf "\nSetup Completed " >&2 ||
printf "\nError Occured " >&2
printf '\nCheck https://remotedesktop.google.com/headless  Copy Command Of Debian Linux And Paste Down\n'
read -p "Paste Here: " CRP
CRP=$(echo $CRP | sed "s|hostname|$INFO|g")
su - one -c """$CRP"""
printf 'Check https://remotedesktop.google.com/access/ \n'
printf 'Your SUDO Pasword Is 8426 \n'



tail -f oout