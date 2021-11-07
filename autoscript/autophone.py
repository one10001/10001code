#!/usr/bin/python

import os
home_dir=os.path.expanduser('~')

listsuccess=home_dir+'/Gsuccess_list.txt'
listerror=home_dir+'/Gerror_list.txt'
list_arabe_male_name=home_dir+'/list_arabe_male_name.txt'
list_arabe_female_name=home_dir+'/list_arabe_female_name.txt'
loop_hour=5
autophone_version="0.1.2"
import arname

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
import names
import sys
import traceback
import requests
from ppadb.client import Client as AdbClient
import random
import PyChromeDevTools
import string
import logging


MobilInfixi0={
    "Name":"Infinix X5516B",
    "ADB_ID":"0412911988106599",
    "rotation":0,
    "display":[720,1440,252],
    "cleaner":[350,1220,2,350,1220,350,1220],
    "action_touch":[662,1285],
    "Chrome_link":[300,105],
    "Focus_link":[300,107],
    "Chrome_fn":[331,540],
    "Focus_fn":[331,517],
    "Chrome_ca":[150,964],# click create account
    "Focus_ca":[163,964],# click create account
    "Chrome_cm":[181,1060],# click me only
    "Focus_cm":[181,1060],# click me only
    "Chrome_em":[346,536],
    "Focus_em":[346,536],
    "Chrome_last":[570,1038],
    "Focus_last":[570,1038],
    "swipe_pgend":[300,700,300,300],
    "accept":[570,1038],
    "Speed":1,

}


MobilInfixi1={
    "Name":"Infinix X5516B",
    "ADB_ID":"0412911988106599",
    "rotation":1,
    "display":[720,1440,252],
    "cleaner":[350,1220,2,350,1220,350,1220],
    "action_touch":[1188,688],
    "Chrome_link":[300,111],
    "Focus_link":[300,107],
    "Chrome_fn":[472,613],
    "Focus_fn":[446,629],
    "Chrome_ca":[390,390],# click create account
    "Focus_ca":[390,390],# click create account
    "Chrome_cm":[430,490],# click me only
    "Focus_cm":[430,490],# click me only
    "Chrome_em":[346,536],
    "Focus_em":[346,536],
    "Chrome_last":[560,850],
    "Focus_last":[560,850],
    "swipe_pgend":[235,560,241,231],
    "accept":[555,1021],
    "Speed":1,



}



MobilSMJ7_disp0={
    "Name":"Sumsung SM-J7008",
    "ADB_ID":"ece4d41a",
    "rotation":0,
    "display":[720,1280,252],
    "cleaner":[350,1220,2,350,1220,350,1220],
    "action_touch":[666,1212],
    "Chrome_link":[300,105],
    "Focus_link":[300,107],
    "Chrome_fn":[331,540],
    "Focus_fn":[331,517],
    "Chrome_ca":[163,964],# click create account
    "Focus_ca":[163,964],# click create account
    "Chrome_cm":[120,765],# click me only
    "Focus_cm":[120,765],# click me only
    "Chrome_em":[346,536],
    "Focus_em":[346,536],
    "Chrome_last":[560,850],
    "Focus_last":[560,850],
    "swipe_pgend":[300,700,300,300],
    "accept":[561,877],
    "Speed":1,

}
# Y fn 540-> 490
#"cleaner":[675,675,2,675,675,675,675],
MobilSMJ7_disp1={
    "Name":"Sumsung SM-J7008",
    "ADB_ID":"ece4d41a",
    "rotation":1,
    "display":[720,1280,252],
    "cleaner":[350,1220,2,350,1220,350,1220],
    "action_touch":[1188,688],
    "Chrome_link":[300,111],
    "Focus_link":[300,107],
    "Chrome_fn":[472,597],
    "Focus_fn":[446,629],
    "Chrome_ca":[390,390],# click create account
    "Focus_ca":[390,390],# click create account
    "Chrome_cm":[430,490],# click me only
    "Focus_cm":[430,490],# click me only
    "Chrome_em":[346,536],
    "Focus_em":[346,536],
    "Chrome_last":[560,850],
    "Focus_last":[560,850],
    "swipe_pgend":[235,560,241,231],
    "accept":[561,877],
    "Speed":1,

}



MobileHwawei_disp0={
    "Name":"HUAWEI SCL-L21",
    "ADB_ID":"3MSDU15C08006757",
    "rotation":0,
    "display":[720,1280,320],
    "cleaner":[521,1258,0,360,1110,360,400],
    "action_touch":[665,1130],
    "Chrome_link":[300,105],
    "Focus_link":[300,107],
    "Chrome_fn":[331,517],
    "Focus_fn":[331,517],
    "Chrome_ca":[163,964],# click create account
    "Focus_ca":[163,964],# click create account
    "Chrome_cm":[120,765],# click me only
    "Focus_cm":[120,765],# click me only
    "Chrome_em":[346,536],
    "Focus_em":[346,536],
    "Chrome_last":[560,850],
    "Focus_last":[560,850],
    "swipe_pgend":[300,700,300,300],
    "accept":[561,877],
    "Speed":1,

}

MobileHwawei_disp1={
    "Name":"HUAWEI SCL-L21",
    "ADB_ID":"3MSDU15C08006757",
    "rotation":1,
    "display":[720,1280,320],
    "cleaner":[521,1258,0,360,1110,360,400],
    "action_touch":[1101,678],
    "Chrome_link":[300,111],
    "Focus_link":[300,107],
    "Chrome_fn":[530,564],
    "Focus_fn":[530,564],
    "Chrome_ca":[186,447],# click create account
    "Focus_ca":[186,447],# click create account
    "Chrome_cm":[210,349],# click me only
    "Focus_cm":[210,349],# click me only
    "Chrome_em":[346,536],
    "Focus_em":[346,536],
    "Chrome_last":[560,850],
    "Focus_last":[560,850],
    "swipe_pgend":[235,560,241,231],
    "accept":[561,877],
    "Speed":1,

}




Mobiles=[MobilSMJ7_disp0,MobileHwawei_disp0,MobilSMJ7_disp1,MobileHwawei_disp1]
#Mobile=MobileHwawei_disp0
Mobile=MobilSMJ7_disp0
#device = devices[0]

### Name Generator ####
G_profile={
    "fn":"amine",
    "ln":"ettayibi",
    "b_day":15,
    "b_month":1,
    "b_year":1995,
    "sex":2,
    "increment":10001

}
def nameArabeGen():
    pass


#### Profile Generator ###


def genarate_gawri_profile(G_profile=G_profile):
    sex=random.randrange(2)+1
    while True:
        if sex==1:
            G_profile["fn"]=names.get_first_name(gender='female').lower()
        else:
            G_profile["fn"]=names.get_first_name(gender='male').lower()
        G_profile["ln"]="el"+names.get_last_name().lower()+"i"
        with open(listerror, 'r') as file:
            data = file.read()
        with open(listsuccess, 'r') as file:
            data2 = file.read()    
        data=data+data2
        if data.find(G_profile["fn"]+G_profile["ln"]) == -1:
                break
    G_profile["b_day"]=random.randrange(28)+1
    G_profile["b_month"]=random.randrange(28)+1
    G_profile["b_year"]=random.randrange(53)+1950
    G_profile["sex"]=sex
    r=random.randrange(1,9)
    G_profile["increment"]=r*10000+r
    return G_profile


def genarate_arabe_profile(G_profile=G_profile):
    sex=random.randrange(2)+1
    while True:
        if sex==1:
            G_profile["fn"]=arname.femal_fn_gen().lower()
        else:
            G_profile["fn"]=arname.mal_fn_gen().lower()
        G_profile["ln"]=arname.rand_ln_gen()
        with open(listerror, 'r') as file:
            data = file.read()
        with open(listsuccess, 'r') as file:
            data2 = file.read()    
        data=data+data2
        if data.find(G_profile["fn"]+G_profile["ln"]) == -1:
                break
    G_profile["b_day"]=random.randrange(28)+1
    G_profile["b_month"]=random.randrange(28)+1
    G_profile["b_year"]=random.randrange(53)+1950
    G_profile["sex"]=sex
    r=random.randrange(1,9)
    G_profile["increment"]=r*10000+r
    return G_profile

def fixrotation(Mobile=Mobile):
    device.shell(f"content insert --uri content://settings/system --bind name:s:accelerometer_rotation --bind value:i:0")
    if(Mobile["rotation"]==0):
        device.shell(f"content insert --uri content://settings/system --bind name:s:user_rotation --bind value:i:0")
    else:        
        device.shell(f"content insert --uri content://settings/system --bind name:s:user_rotation --bind value:i:1")

def reset_rotation():
    device.shell(f"content insert --uri content://settings/system --bind name:s:user_rotation --bind value:i:0")
    device.shell(f"content insert --uri content://settings/system --bind name:s:accelerometer_rotation --bind value:i:0")


def rsleep(time_s,pec=50):
    x=(random.randrange(100)-49)*time_s/pec
    time.sleep(time_s+x)

def swipe_pgend(Mobile=Mobile):
    x1=Mobile["swipe_pgend"][0]
    y1=Mobile["swipe_pgend"][1]
    x2=Mobile["swipe_pgend"][2]
    y2=Mobile["swipe_pgend"][3]
    for i in range(5):
    #    device.shell(f"input swipe {x1} {y1} {int(x2/2)} {int(y2/2)} &&  swipe {int(x2/2)} {int(y2/2)} {x2/2} {y2/2}")
        device.shell(f"input roll 15 15")

def mob_faker(Mobile=Mobile):
    w=Mobile['display'][0]
    h=Mobile['display'][1]
    d=Mobile['display'][2]
    model='Huawei SCL-L27'
    #device.shell(f'wm density {d+random.randrange(5)}')#chqnge density
    device.shell(f'wm size {w+random.randrange(5)*2}x{h+random.randrange(5)*2}')
    device.shell(f'content insert --uri content://settings/global --bind name:s:device_name --bind value:s:\"{model}\"')
    print(device.shell("adb shell settings get global device_name"))
    print(device.shell("wm size"))

def mob_clean(Mobile=Mobile):
    x=Mobile["cleaner"][0]
    y=Mobile["cleaner"][1]
    x1=Mobile["cleaner"][3]
    y1=Mobile["cleaner"][4]
    x2=Mobile["cleaner"][5]
    y2=Mobile["cleaner"][6]
    #device.shell(f"content insert --uri content://settings/system --bind name:s:accelerometer_rotation --bind value:i:0")
    #device.shell(f"content insert --uri content://settings/system --bind name:s:user_rotation --bind value:i:0")
    reset_rotation()
    if(Mobile["cleaner"][2]==0):
        #device.shell(f"input tap {x} {y}")
        device.shell(f"input keyevent KEYCODE_HOME")
        rsleep(1)
        device.shell(f"input keyevent KEYCODE_APP_SWITCH")
        rsleep(4)
        device.shell(f"input swipe {x1} {y1} {x2} {y2}")
        rsleep(0.2)
    if(Mobile["cleaner"][2]==1):
        #device.shell(f"input tap {x} {y}")
        device.shell(f"input keyevent KEYCODE_HOME")
        rsleep(1)
        device.shell(f"input keyevent KEYCODE_APP_SWITCH")
        rsleep(4)
        device.shell(f"input swipe {x1} {y1} {x2} {y2}")
        rsleep(1)
        device.shell(f"input swipe {x1} {y1} {x2} {y2}")
        rsleep(0.2)
    if(Mobile["cleaner"][2]==2):
        #device.shell(f"input tap {x} {y}")
        device.shell(f"input keyevent KEYCODE_HOME")
        rsleep(1)
        device.shell(f"input keyevent KEYCODE_APP_SWITCH")
        rsleep(4)
        device.shell(f"input tap {x} {y}")
        #rsleep(1)
        #device.shell(f"input tap {x} {y}")
        rsleep(0.2)

def write_string(s):
    for c in s:
        rsleep(0.3,50)
        if c.isupper():
            device.shell('input text '+c)
        else:
            device.shell('input keyevent KEYCODE_'+c.upper())

def rtouch(x,y,rx=7,ry=10):
    x=x+random.randrange(rx)-int(rx/2)
    y=y+random.randrange(ry)-int(ry/2)
    device.shell(f"input tap {x} {y}")

def nav_open(browser_type=0,Mobile=Mobile):
    x=Mobile["Chrome_link"][0]
    y=Mobile["Chrome_link"][1]
    device.shell("am force-stop com.hsv.privatebrowser")
    device.shell("am force-stop com.android.chrome")
    device.shell("am force-stop org.mozilla.focus")
    if browser_type==0:
        device.shell("am force-stop com.android.chrome")
        device.shell("am start -n com.android.chrome/org.chromium.chrome.browser.incognito.IncognitoTabLauncher")
        time.sleep(4)
        device.shell(f"input tap {x} {y}")
        time.sleep(2)
        device.shell("input text 'console.cloud.google.com'")
        time.sleep(0.3)
        device.shell('input keyevent "KEYCODE_ENTER" ')
        time.sleep(2)
    elif browser_type==3:
        device.shell("am start -n com.android.chrome/org.chromium.chrome.browser.incognito.IncognitoTabLauncher")
        time.sleep(20)
        os.system("adb forward --remove-all")
        os.system("adb  -s "+Mobile["ADB_ID"]+" forward tcp:19222 localabstract:chrome_devtools_remote")
        time.sleep(9)
        chrome = PyChromeDevTools.ChromeInterface(host="127.0.0.1",port=19222,timeout=120)
        chrome.Network.enable()
        time.sleep(2)
        chrome.Page.enable()
        time.sleep(2)
        chrome.Page.navigate(url="https://console.cloud.google.com/")
        time.sleep(2)
        chrome.Page.navigate(url="https://console.cloud.google.com/")
        chrome.wait_event("Page.loadEventFired", timeout=60)
    elif browser_type==1:
        device.shell("am force-stop com.hsv.privatebrowser")
        device.shell("am start -n com.hsv.privatebrowser/com.google.android.apps.chrome.Main -d console.cloud.google.com")
    elif browser_type==2:
        device.shell("am start -n org.mozilla.focus/org.mozilla.focus.activity.MainActivity ")
        time.sleep(2)
        device.shell(f"input tap {x} {y}")
        time.sleep(2)
        device.shell("input text 'console.cloud.google.com'")
        time.sleep(0.3)
        device.shell('input keyevent "KEYCODE_ENTER" ')
    rsleep(7)    


def click_create_acc(Mobile=Mobile):
    ca_x=Mobile["Chrome_ca"][0]
    ca_y=Mobile["Chrome_ca"][1]
    cm_x=Mobile["Chrome_cm"][0]
    cm_y=Mobile["Chrome_cm"][1]
    rtouch(10,450)
    if(Mobile["rotation"]!=0):
        swipe_pgend(Mobile)
    rtouch(ca_x,ca_y) # click create account
    rsleep(2)
    rtouch(cm_x,cm_y) # click me only
    rsleep(5)



def action_touch(Mobile=Mobile):
    x=Mobile["action_touch"][0]
    y=Mobile["action_touch"][1]
    rtouch(x,y)

def first_step(G_Profile=G_profile ,loop_i=0,Mobile=Mobile):
    fn=G_Profile["fn"]
    ln=G_Profile["ln"]
    incerment=G_Profile["increment"]
    fn_x=Mobile["Chrome_fn"][0]
    fn_y=Mobile["Chrome_fn"][1]
    gid=f"{fn}{ln}{incerment+loop_i}"
    print('first_step: '+gid)
    rtouch(fn_x,fn_y) #first name
    rsleep(0.7)
    #rtouch(fn_x,fn_y)
    write_string(fn) #first name
    rsleep(0.1)
    action_touch(Mobile) #next to ln
    rsleep(0.1)
    write_string(ln) #last name
    rsleep(0.1)
    action_touch(Mobile) #next to email
    device.shell('input keyevent "KEYCODE_TAB" ') #or  333 566
    rsleep(0.1)
    device.shell('input keyevent "KEYCODE_ENTER" ') #or 333 566
    rsleep(0.3)
    write_string(gid)
    rsleep(0.2)
    action_touch(Mobile) #next to pass
    rsleep(0.1)
    write_string('Ms123456789') #last name
    rsleep(0.2)
    action_touch(Mobile) #next to confirm pass
    rsleep(0.1)
    write_string('Ms123456789') #last name
    rsleep(0.2)
    action_touch(Mobile) #next to step
    rsleep(7)
    return gid


def se_step(G_Profile=G_profile,Mobile=Mobile):
    sex=G_profile["sex"]
    day=G_profile["b_day"]
    month=G_profile["b_month"]
    year=G_profile["b_year"]
    print("second_step")
    x_em=Mobile["Chrome_em"][0]
    y_em=Mobile["Chrome_em"][1]
    rsleep(0.1)
    rtouch(x_em,y_em)
    rsleep(0.1)
    device.shell('input keyevent "KEYCODE_TAB" ')
    rsleep(0.1)
    device.shell('input keyevent "KEYCODE_TAB" ')
    rsleep(0.1)
    write_string(str(day)) #day of birth 
    rsleep(0.1)
    device.shell('input keyevent "KEYCODE_TAB" ')
    rsleep(0.1)
    for i in range(month):
        device.shell('input keyevent "KEYCODE_DPAD_DOWN" ')
        rsleep(0.1)
    device.shell('input keyevent "KEYCODE_TAB" ')
    rsleep(0.1)
    write_string(str(year)) #last name
    rsleep(0.1)
    device.shell('input keyevent "KEYCODE_TAB" ')
    for i in range(sex):
        device.shell('input keyevent "KEYCODE_DPAD_DOWN" ')
        rsleep(0.1)    
    device.shell('input keyevent "KEYCODE_TAB" ')
    rsleep(0.1)
    device.shell('input keyevent "KEYCODE_TAB" ')
    rsleep(0.1)
    device.shell('input keyevent "KEYCODE_ENTER" ')
    rsleep(7)
    return sex

def tird_step(Mobile=Mobile):
    print("third_step")
    #for i in range(8):
    #    device.shell('input keyevent "KEYCODE_TAB" ')
    #    rsleep(0.1)
    #device.shell('input keyevent "KEYCODE_ENTER" ')
    for i in range(4):
        device.shell('input roll 15 15')
    rsleep(0.5)
    rtouch(Mobile['accept'][0],Mobile['accept'][1])

def newip():
    print(device.shell('curl https://api.myip.com --insecure -4 --max-time 10 --retry 10 --retry-max-time 40 -s'))
    os.system("ssh root@10.10.0.3 ifup DSL2")
    time.sleep(7)
    print(device.shell('curl https://api.myip.com --insecure -4 --max-time 10 --retry 10 --retry-max-time 40 -s'))

def check_succes(Mobile=Mobile):
    os.system("adb forward --remove-all")
    time.sleep(2)
    os.system("adb  -s "+Mobile["ADB_ID"]+" forward tcp:19222 localabstract:chrome_devtools_remote")
    time.sleep(3)
    chrome = PyChromeDevTools.ChromeInterface(host="127.0.0.1",port=19222,timeout=120)
    chrome.Network.enable()
    chrome.Page.enable()
    chrome.Page.navigate(url="https://console.cloud.google.com")
    time.sleep(10)
    event,messages=chrome.wait_event("Page.frameStoppedLoading", timeout=60)
    try:
        if str(messages).find("https://console.cloud.google.com/m") != -1:
            print('success')
            return True
    except:
        print('error check success')
    # for m in messages:
    #     if "method" in m and m["method"] == "Network.responseReceived":
    #         try:
    #             url=m["params"]["response"]["url"]
    #             if url.find("https://console.cloud.google.com/m") != -1:
    #                 print('success')
    #                 return True
    #         except:
    #             pass
    print('check_succes: False ')
    return False

def check_succes2(Mobile=Mobile):
    os.system("adb forward --remove-all")
    time.sleep(2)
    os.system("adb  -s "+Mobile["ADB_ID"]+" forward tcp:19222 localabstract:chrome_devtools_remote")
    time.sleep(phone_speed+3)
    chrome = PyChromeDevTools.ChromeInterface(host="127.0.0.1",port=19222,timeout=120)
    time.sleep(phone_speed+3)
    chrome.Network.enable()
    time.sleep(phone_speed+3)
    chrome.Page.enable()
    time.sleep(phone_speed+3)
    chrome.Page.navigate(url="https://gmail.com")
    time.sleep(phone_speed+10)
    event,messages=chrome.wait_event("Page.frameStoppedLoading", timeout=60)
    try:
        if str(messages).find("https://mail.google.com/mail/mu/") != -1:
            print('success')
            return True
    except:
        print('error check success')
    # for m in messages:
    #     if "method" in m and m["method"] == "Network.responseReceived":
    #         try:
    #             url=m["params"]["response"]["url"]
    #             if url.find("https://console.cloud.google.com/m") != -1:
    #                 print('success')
    #                 return True
    #         except:
    #             pass
    print('check_succes: False ')
    return False

def phone_select(phone_i,Mobiles):
    for i in range(len(Mobiles)):
        #if phone_i%len(Mobiles) == 0 :
        print("*********** selected phone: "+Mobiles[phone_i%len(Mobiles)]['Name']
        +     " ***********")
        return Mobiles[phone_i%len(Mobiles)]

chrome = None

phone_i=0
execep=0
phone_speed=9
print("Autophone Ver: "+autophone_version)
Mobiles=[MobileHwawei_disp0,MobilSMJ7_disp1,MobileHwawei_disp1,MobilSMJ7_disp0]
#Mobiles=[MobilSMJ7_disp1,MobileHwawei_disp0,MobilSMJ7_disp0,MobileHwawei_disp1]
#if __name__ == '__main__':
client = AdbClient(host="127.0.0.1", port=5037) # Default is "127.0.0.1" and 5037
devices = client.devices()
while True:   
    try:
        phone_speed=phone_speed+random.randrange(5)
        Mobile=phone_select(phone_i,Mobiles)
        device = client.device(Mobile["ADB_ID"])
        os.system("adb forward --remove-all")
        os.system("adb -s "+Mobile["ADB_ID"]+" forward tcp:19222 localabstract:chrome_devtools_remote")
    #############################
        newip()
        G_profile=genarate_arabe_profile(G_profile)
        #mob_faker(Mobile=Mobile)
        for i in range(3):
            mob_clean(Mobile)
            fixrotation(Mobile)
            nav_open(3,Mobile=Mobile) 
            #chrome.wait_event("Page.loadEventFired", timeout=60)
            rsleep(5)
            click_create_acc(Mobile)
            rsleep(5)
            #chrome.wait_event("Page.loadEventFired", timeout=60)
            new_gid=first_step(G_Profile=G_profile,loop_i=i ,Mobile=Mobile)
            ########### non critical step
            reset_rotation()
            rsleep(5)
            se_step(G_Profile=G_profile ,Mobile=Mobile)
            rsleep(5)
            tird_step(Mobile=Mobile)
            rsleep(5)
            if (check_succes2(Mobile=Mobile)==False):
                print("error ")
                with open(listerror, "a") as error_list:
                    print("Wirting in Error list")
                    error_list.write("\n")
                    error_list.write(new_gid)
                break
            else:
                print("------>   "+new_gid+"   <------")
                with open(listsuccess, "a") as success_list:
                    print("Wirting in Success list")
                    success_list.write("\n")
                    success_list.write(new_gid)
        execep=0
        phone_i=phone_i+1
    except Exception as e:
    #except:
        print("XXXXXXXXXXXXXXXX big error n°"+str(execep)+": "+Mobile["ADB_ID"] +
              " Rotation:"+Mobile["rotation"] + " XXXXXXXXXXXXXXXXXXXXX")
        print(e)
        print("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
        execep=execep+1
        time.sleep(60)
        if execep>2:
            phone_i=phone_i+1
        else:
            continue

    for i  in range(loop_hour):
        time_sleep=3000+random.randrange(1200)
        print("*** sleeping for :"+str(time_sleep/60)+'min')
        #rsleep(3600)
        time.sleep(time_sleep)
        print("*")