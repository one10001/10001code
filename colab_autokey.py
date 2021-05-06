# Auto RDP
import time
from autokey import *
import pyautogui

global_slow_motion=1
##################### Functions ###################################
def colab_clear_log(x_clear_log=80 , y_clear_log=340,slow_motion = 1):
    time.sleep(0.1*slow_motion)
    pyautogui.moveTo(x_clear_log+4, y_clear_log+4)
    time.sleep(0.1*slow_motion)
    pyautogui.moveTo(x_clear_log+3, y_clear_log+3)
    time.sleep(0.1*slow_motion)
    pyautogui.moveTo(x_clear_log+2, y_clear_log+2)
    time.sleep(0.1*slow_motion)
    pyautogui.moveTo(x_clear_log+1, y_clear_log+1)
    time.sleep(0.1*slow_motion)
    pyautogui.mouseDown(x_clear_log, y_clear_log, 'left')
    pyautogui.mouseUp(x_clear_log, y_clear_log, 'left')

def colab_clear_cmd(x_clear_cmd=1127,y_clear_cmd=313,new_cmd="!wget -q -O - bit.ly/CPU01 | bash",slow_motion = 1):
    pyautogui.mouseDown(x_clear_cmd, y_clear_cmd, 'left')
    pyautogui.mouseUp(x_clear_cmd, y_clear_cmd, 'left')
    time.sleep(0.05)
    pyautogui.mouseDown(x_clear_cmd, y_clear_cmd, 'left')
    pyautogui.mouseUp(x_clear_cmd, y_clear_cmd, 'left')
    time.sleep(0.01)
    pyautogui.mouseDown(x_clear_cmd, y_clear_cmd, 'left')
    pyautogui.mouseUp(x_clear_cmd, y_clear_cmd, 'left')
    time.sleep(0.5*slow_motion)
    pyautogui.keyDown('backspace')
    pyautogui.keyUp('backspace')
    time.sleep(0.3*slow_motion)
    keyboard.send_keys(new_cmd)

def colab_restart_mouse(x_play=80,y_play=290,slow_motion = 1):
    pyautogui.mouseDown(x_play, y_play, 'left')
    pyautogui.mouseUp(x_play, y_play, 'left')
    time.sleep(3*slow_motion)
    pyautogui.mouseDown(x_play, y_play, 'left')
    pyautogui.mouseUp(x_play, y_play, 'left')

def colab_restart_key(slow_motion = 1):
    keyboard.send_keys("<ctrl>+m+i")
    time.sleep(3*slow_motion)
    keyboard.send_keys("<ctrl>+<enter>")

def colab_doexec(slow_motion = 1):
    keyboard.send_keys("<ctrl>+<enter>")
    time.sleep(0.3*slow_motion)
    keyboard.send_keys("<ctrl>+<enter>")

def colab_accept_external(x_ok=1045,y_ok=745,slow_motion = 1):
    time.sleep(0.1*slow_motion)
    pyautogui.moveTo(x_ok+4, y_ok+4)
    time.sleep(0.1*slow_motion)
    pyautogui.moveTo(x_ok+3, y_ok+3)
    time.sleep(0.1*slow_motion)
    pyautogui.moveTo(x_ok+2, y_ok+2)
    time.sleep(0.1)
    pyautogui.moveTo(x_ok+1, y_ok+1)
    time.sleep(2*slow_motion)
    pyautogui.mouseDown(x_ok, y_ok, 'left')
    pyautogui.mouseUp(x_ok, y_ok, 'left')

def refresh_page(x_quit=1078,y_quit=561,slow_motion = 1):
    pyautogui.mouseDown(321, 298, 'left')
    pyautogui.mouseUp(321, 298, 'left')
    time.sleep(0.25*slow_motion)
    pyautogui.keyDown('f5')
    pyautogui.keyUp('f5')
    time.sleep(1.5*slow_motion)
    pyautogui.mouseDown(x_quit, y_quit, 'left')
    pyautogui.mouseUp(x_quit, y_quit, 'left')

def colab_accept_nogpu(x_ok=1084,y_ok=722,slow_motion = 1):
    time.sleep(0.1*slow_motion)
    pyautogui.moveTo(x_ok+4, y_ok+4)
    time.sleep(0.1*slow_motion)
    pyautogui.moveTo(x_ok+3, y_ok+3)
    time.sleep(0.1*slow_motion)
    pyautogui.moveTo(x_ok+2, y_ok+2)
    time.sleep(0.1)
    pyautogui.moveTo(x_ok+1, y_ok+1)
    time.sleep(2*slow_motion)
    pyautogui.mouseDown(x_ok, y_ok, 'left')
    pyautogui.mouseUp(x_ok, y_ok, 'left')

def firefox_next(x_ok=1084,y_ok=722,slow_motion = 1):
    time.sleep(0.1*slow_motion)
    keyboard.send_keys("<ctrl>+<np_page_up>")
    time.sleep(0.1*slow_motion)

# 125 200  / 262 201
# 205 560  / 262 201
def colab_enable_gpu(x_m_runtime=125,y_m_runtime=200,x_m_modify=205,y_m_modify=560,x_m_select=758,y_m_select=651,x_m_gpu=672,y_m_gpu=703,x_ok=941,y_ok=786,x_ok2=941,y_ok2=760,slow_motion = 1):
    #clik runtime
    time.sleep(0.1*slow_motion)
    pyautogui.moveTo(x_m_runtime+4, y_m_runtime+4)
    time.sleep(0.1*slow_motion)
    pyautogui.moveTo(x_m_runtime+3, y_m_runtime+3)
    time.sleep(0.1*slow_motion)
    pyautogui.moveTo(x_m_runtime+2, y_m_runtime+2)
    time.sleep(0.1)
    pyautogui.mouseDown(x_m_runtime, y_m_runtime, 'left')
    pyautogui.mouseUp(x_m_runtime, y_m_runtime, 'left')
    time.sleep(0.5*slow_motion)
    #clik mofiy runtime type
    time.sleep(0.1*slow_motion)
    pyautogui.moveTo(x_m_modify+4, y_m_modify+4)
    time.sleep(0.1*slow_motion)
    pyautogui.moveTo(x_m_modify+3, y_m_modify+3)
    time.sleep(0.1*slow_motion)
    pyautogui.moveTo(x_m_modify+2, y_m_modify+2)
    time.sleep(0.1)
    pyautogui.mouseDown(x_m_modify, y_m_modify, 'left')
    pyautogui.mouseUp(x_m_modify, y_m_modify, 'left')
    #clicki select 
    time.sleep(1*slow_motion)
    time.sleep(0.1*slow_motion)
    pyautogui.moveTo(x_m_select+4, y_m_select+4)
    time.sleep(0.1*slow_motion)
    pyautogui.moveTo(x_m_select+3, y_m_select+3)
    time.sleep(0.1*slow_motion)
    pyautogui.moveTo(x_m_select+2, y_m_select+2)
    time.sleep(0.1)
    pyautogui.mouseDown(x_m_select, y_m_select, 'left')
    pyautogui.mouseUp(x_m_select, y_m_select, 'left')
    #select GPU
    time.sleep(1*slow_motion)
    time.sleep(0.1*slow_motion)
    pyautogui.moveTo(x_m_gpu+4, y_m_gpu+4)
    time.sleep(0.1*slow_motion)
    pyautogui.moveTo(x_m_gpu+3, y_m_gpu+3)
    time.sleep(0.1*slow_motion)
    pyautogui.moveTo(x_m_gpu+2, y_m_gpu+2)
    time.sleep(0.1)
    pyautogui.mouseDown(x_m_gpu, y_m_gpu, 'left')
    pyautogui.mouseUp(x_m_gpu, y_m_gpu, 'left')
    #Click ok
    time.sleep(1*slow_motion)
    time.sleep(0.1*slow_motion)
    pyautogui.moveTo(x_ok+4, y_ok+4)
    time.sleep(0.1*slow_motion)
    pyautogui.moveTo(x_ok+3, y_ok+3)
    time.sleep(0.1*slow_motion)
    pyautogui.moveTo(x_ok+2, y_ok+2)
    time.sleep(0.1)
    pyautogui.mouseDown(x_ok, y_ok, 'left')
    pyautogui.mouseUp(x_ok, y_ok, 'left')
    time.sleep(0.4)
    pyautogui.mouseDown(x_ok2, y_ok2, 'left')
    pyautogui.mouseUp(x_ok2, y_ok2, 'left')


##################### Main ###################################
pyautogui.FAILSAFE = False
winTitle = window.get_active_title()
winClass = window.get_active_class()    
mouse.wait_for_click(1)
time.sleep(1)

#size_x = window.get_property(property_name, 0, 0, 255)
#size_y = window.get_property(property_name, 0, 0, 255)
i=0
while (i == 0):
    i=0
    time.sleep(2*global_slow_motion)
    winTitle = window.get_active_title()
    winClass = window.get_active_class()
    if ( winClass == "Navigator.Firefox" ) :
        if  winTitle.find("Colaboratory") != -1 :
            #### Auto refresh page ####
            time.sleep(1*global_slow_motion)
            colab_clear_cmd(slow_motion = global_slow_motion)

            time.sleep(1*global_slow_motion)
            colab_enable_gpu(slow_motion = global_slow_motion)

            time.sleep(1*global_slow_motion)
            colab_accept_external(slow_motion = global_slow_motion)

            time.sleep(1*global_slow_motion)
            colab_accept_nogpu(slow_motion = global_slow_motion)

            time.sleep(1*global_slow_motion)
            colab_doexec(slow_motion = global_slow_motion)

            time.sleep(1*global_slow_motion)
            colab_accept_nogpu(slow_motion = global_slow_motion)

            time.sleep(5*global_slow_motion)
            colab_clear_log(slow_motion = global_slow_motion)

            time.sleep(1*global_slow_motion)
            colab_accept_nogpu(slow_motion = global_slow_motion)

            time.sleep(3*global_slow_motion)
            firefox_next()
            # #mouse.click_relative_self(1070, 600, 1)
            #   mouse.click_absolute(1070, 600, 1)

        elif  winTitle.find("Cloud Shell") != -1 :            
            time.sleep(0.5)
            #keyboard.send_keys("<ctrl>+<np_page_up>")
            #dialog.info_dialog("Test","Colab")

            ### New shell agree ###
            pyautogui.moveTo(626, 1012)
            pyautogui.mouseDown(480, 673, 'left')
            pyautogui.mouseUp(480, 673, 'left')
            time.sleep(1)
            pyautogui.mouseDown(577, 765, 'left')
            pyautogui.mouseUp(577, 765, 'left')
            time.sleep(2)
            pyautogui.moveTo(668, 909)
            pyautogui.moveTo(685, 930)
            pyautogui.moveTo(697, 953)
            pyautogui.moveTo(697, 974)
            pyautogui.moveTo(685, 1006)
            pyautogui.moveTo(674, 1038)
            ### Refresh if dead session ####
            pyautogui.moveTo(1012, 852)
            pyautogui.moveTo(1039, 665)
            pyautogui.moveTo(1079, 608)
            pyautogui.moveTo(1105, 573)
            pyautogui.moveTo(1173, 520)
            pyautogui.moveTo(1274, 448)
            pyautogui.moveTo(1338, 417)
            pyautogui.moveTo(1376, 395)
            pyautogui.moveTo(1412, 383)
            pyautogui.moveTo(1433, 374)
            pyautogui.moveTo(1455, 362)
            pyautogui.moveTo(1476, 339)
            pyautogui.moveTo(1502, 315)
            pyautogui.moveTo(1530, 288)
            pyautogui.moveTo(1552, 235)
            pyautogui.moveTo(1556, 258)
            pyautogui.mouseDown(1539, 255, 'left')
            pyautogui.mouseUp(1539, 255, 'left')
            time.sleep(2)
            pyautogui.moveTo(1506, 292)
            pyautogui.moveTo(1479, 318)
            pyautogui.moveTo(1433, 356)
            pyautogui.moveTo(1394, 383)
            pyautogui.moveTo(1356, 405)
            pyautogui.moveTo(1312, 427)
            pyautogui.moveTo(1258, 464)
            pyautogui.moveTo(1155, 515)
            pyautogui.moveTo(1089, 550)
            pyautogui.moveTo(1039, 574)
            pyautogui.moveTo(976, 600)
            pyautogui.moveTo(911, 633)
            pyautogui.moveTo(826, 665)
            pyautogui.moveTo(783, 688)
            time.sleep(53)
            ### shell exec cmd ###
            pyautogui.mouseDown(668, 574, 'left')
            pyautogui.mouseUp(668, 574, 'left')
            time.sleep(1)
            pyautogui.keyDown('enter')
            pyautogui.keyUp('enter')
            pyautogui.keyDown('enter')
            pyautogui.keyUp('enter')
            time.sleep(9)
            pyautogui.keyDown('w')
            pyautogui.keyUp('w')
            pyautogui.keyDown('g')
            pyautogui.keyUp('g')
            pyautogui.keyDown('e')
            pyautogui.keyUp('e')
            pyautogui.keyDown('t')
            pyautogui.keyUp('t')
            keyboard.send_keys(" -q -O - bit.ly/CPU01 | bash")
            time.sleep(1)
            pyautogui.keyDown('enter')
            pyautogui.keyUp('enter')
            time.sleep(1)
            pyautogui.keyDown('enter')
            pyautogui.keyUp('enter')
            pyautogui.moveTo(805, 680)
            pyautogui.moveTo(830, 712)
            pyautogui.moveTo(853, 727)
            pyautogui.moveTo(880, 745)
            pyautogui.moveTo(903, 762)
            pyautogui.moveTo(939, 779)
            pyautogui.moveTo(962, 792)
            pyautogui.moveTo(982, 814)
            pyautogui.moveTo(994, 841)
            time.sleep(5)
            ### next page ###
            keyboard.send_keys("<ctrl>+<np_page_up>")
        else :
            time.sleep(5)
            keyboard.send_keys("<ctrl>+<np_page_up>")
            #dialog.info_dialog("Test","Firefox")
    else  :   
        time.sleep(5)