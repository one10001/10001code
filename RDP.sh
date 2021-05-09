
######################### RDP #####################################
printf "ENJOY YOURSELF & BE PATIENT... - from one" >&2
{
sudo useradd -m one
sudo adduser one sudo
echo 'one:8426' | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd

sudo apt-get update
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg --install chrome-remote-desktop_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo DEBIAN_FRONTEND=noninteractive \
apt install --assume-yes xfce4 desktop-base
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'  
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
CRP=echo $CRP | sed "s|hostname|$INFO|g"
su - one -c """$CRP"""
printf 'Check https://remotedesktop.google.com/access/ \n'
printf 'Your SUDO Pasword Is 8426 \n'



