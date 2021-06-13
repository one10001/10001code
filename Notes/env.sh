mkdir /tmp/preenv
cd /tmp/preenv
sudo apt update 
sudo apt install xvfb python3 python-is-python3 python3-pip python3-tk python3-dev git python3-dev python3-tk python3-setuptools python3-wheel python3-pip python3-wxgtk4.0  autokey-gtk autokey-common -y
sudo pip3 install pyautogui selenium pytest
sudo apt purge firefox -y
wget -O firefox-mozilla-build_87.0-0ubuntu1_amd64.deb https://sourceforge.net/projects/ubuntuzilla/files/mozilla/apt/pool/main/f/firefox-mozilla-build/firefox-mozilla-build_87.0-0ubuntu1_amd64.deb/download
sudo dpkg -i firefox-mozilla-build_87.0-0ubuntu1_amd64.deb
wget -O geko.tar.gz https://github.com/mozilla/geckodriver/releases/download/v0.29.1/geckodriver-v0.29.1-linux64.tar.gz
tar -xzf geko.tar.gz
cp geckodriver /bin/geckodriver
