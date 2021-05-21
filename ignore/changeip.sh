#!/bin/bash
c=`cat <<EOF
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
slow_motion=1
driver = webdriver.Firefox()
try:
    print("Old IP:")
    r = requests.get('https://ifconfig.me/all.json')
    print( r.json())
    driver.set_window_size(1600, 1600 )
    driver.get("http://10.10.10.1/")
    time.sleep(0.1*slow_motion)
    driver.find_element(By.ID, "Frm_Username").click()
    driver.find_element(By.ID, "Frm_Username").send_keys("admin")
    driver.find_element(By.ID, "Frm_Password").send_keys("----------")
    driver.find_element(By.ID, "Frm_Password").send_keys(Keys.ENTER)
    time.sleep(0.2*slow_motion)
    driver.switch_to.frame(1)
    time.sleep(0.2*slow_motion)
    driver.find_element(By.CSS_SELECTOR, "#mmNet > .menuPlusSymbol").click()
    driver.find_element(By.ID, "ssmETHWAN46Con").click()
    driver.find_element(By.ID, "ssmTTYWANCon").click()
    driver.find_element(By.ID, "ssmETHWAN46Con").click()
    driver.find_element(By.ID, "Frm_WANCName0").click()
    time.sleep(0.2*slow_motion)
    dropdown = driver.find_element(By.ID, "Frm_WANCName0")
    dropdown.find_element(By.XPATH, "//option[. = 'omci_ipv4_pppoe_1']").click()
    driver.find_element(By.ID, "Frm_IpMode").click()
    dropdown = driver.find_element(By.ID, "Frm_IpMode")
    dropdown.find_element(By.XPATH, "//option[. = 'IPv4']").click()
    driver.find_element(By.CSS_SELECTOR, "#Frm_IpMode > option:nth-child(1)").click()
    time.sleep(0.1*slow_motion)
    driver.find_element(By.ID, "Btn_DoEdit").click()
    time.sleep(0.1*slow_motion)
    driver.find_element(By.ID, "Btn_DoEdit").click()
    time.sleep(0.1*slow_motion)
    time.sleep(2*slow_motion)
    driver.find_element(By.ID, "Frm_IpMode").click()
    dropdown = driver.find_element(By.ID, "Frm_IpMode")
    dropdown.find_element(By.XPATH, "//option[. = 'IPv4/v6']").click()
    driver.find_element(By.CSS_SELECTOR, "#Frm_IpMode > option:nth-child(3)").click()
    driver.find_element(By.ID, "Frm_IsAuto").click()
    dropdown = driver.find_element(By.ID, "Frm_IsAuto")
    dropdown.find_element(By.XPATH, "//option[. = 'Auto Mode']").click()
    driver.find_element(By.CSS_SELECTOR, "#Frm_IsAuto > option:nth-child(2)").click()
    time.sleep(0.1*slow_motion)
    driver.find_element(By.ID, "Btn_DoEdit").click()
    time.sleep(0.1*slow_motion)
    driver.find_element(By.ID, "Btn_DoEdit").click()
    time.sleep(0.1*slow_motion)
    time.sleep(0.5*slow_motion)
    driver.find_element(By.ID, "Fnt_mmStatu").click()
    time.sleep(0.5*slow_motion)
    time.sleep(5)
    print("New IP:")
    r = requests.get('https://ifconfig.me/all.json',timeout=30)
    print( r.json() )
except:
    print("Error IP Changing")
EOF`
xvfb python -c "$c"


