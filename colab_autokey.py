# Displays the information of the next window to be left-clicked
import time
mouse.wait_for_click(1)
time.sleep(1)
winTitle = window.get_active_title()
winClass = window.get_active_class()

#size_x = window.get_property(property_name, 0, 0, 255)
#size_y = window.get_property(property_name, 0, 0, 255)

while (True):
    if ( winClass == "Navigator.Firefox" ) :
        if  winTitle.find("Colaboratory") != -1 :
            #keyboard.send_keys("<ctrl>+a")
            #time.sleep(0.5)
            #keyboard.send_key("<delete>")
            #keyboard.send_keys("! wget -O - bit.ly/MAX0002 | bash")
            mouse.click_relative_self(1183, 490, 1)
            time.sleep(3)
            keyboard.send_keys("<ctrl>+<enter>")
            time.sleep(2)


            mouse.click_relative_self(1183, 490, 1)
            #  mouse.click_absolute(100, 100, 1)
            #keyboard.send_keys("<tab>")
            time.sleep(2)
            keyboard.send_keys("<enter>")
            time.sleep(2
            )
            keyboard.send_keys("<ctrl>+<np_page_up>")
            #dialog.info_dialog("Test","Colab")
        else:
            keyboard.send_keys("<ctrl>+<np_page_up>")
            #dialog.info_dialog("Test","Firefox")
        
    else:   
        dialog.info_dialog("Test","Other")