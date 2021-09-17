#!/bin/bash

#1- Reset Ip
ssh root@10.10.0.3 ifup DSL2

#2- cleaning device
adb shell am force-stop com.hsv.privatebrowser

#adb shell input keyevent  "FLAG_EDITOR_ACTION" 
#3- Android Private Browser steps
adb shell dumpsys window windows | grep -E 'mCurrentFocus|mFocusedApp'
adb shell am start -n com.android.chrome/org.chromium.chrome.browser.incognito.IncognitoTabLauncher
#adb shell am start -n com.hsv.privatebrowser/com.google.android.apps.chrome.Main -d console.cloud.google.com
adb shell input tap 300 111
adb shell input text 'console.cloud.google.com'
adb shell input keyevent "KEYCODE_ENTER" 
adb shell input tap 163 964 # click create account
adb shell input tap 120 765 # click me only
adb shell input tap 200 500 # fname
adb shell input text 'adam'
adb shell input tap 665 1130 # nextbutton
adb shell input text 'zirzar'
adb shell input tap 665 1130 # nextbutton
adb shell input keyevent "KEYCODE_TAB" 
adb shell input keyevent "KEYCODE_ENTER"
adb shell input text 'aminezirzar10001'
adb shell input tap 665 1130 # nextbutton
adb shell input text 'Ms123456789'
adb shell input tap 665 1130 # nextbutton
adb shell input text 'Ms123456789'
adb shell #input keyevent "KEYCODE_ENTER"adb shell 
adb shell input tap 665 1130
adb shell input tap 200 900 # create gmail ---

## step 2

adb shell input tap 344 541
adb shell input tap 665 1130 # nextbutton
adb shell input tap 665 1130 # nextbutton

adb shell input keyevent "KEYCODE_6"   
adb shell input keyevent "KEYCODE_TAB" 
adb shell input keyevent "KEYCODE_TAB" 
adb shell input keyevent "KEYCODE_DPAD_DOWN"
adb shell input keyevent "KEYCODE_TAB" 

adb shell input text '1991'
adb shell input keyevent "KEYCODE_TAB" 
adb shell input keyevent "KEYCODE_DPAD_DOWN" #woman
adb shell input keyevent "KEYCODE_DPAD_DOWN" #man
adb shell input swipe 300 700 300 300
adb shell input swipe 300 700 300 300
adb shell input swipe 300 700 300 300

adb shell input tap 560 850 # Next ---

adb shell input swipe 300 700 300 300
adb shell input swipe 300 700 300 300
adb shell input swipe 300 700 300 300
adb shell input swipe 300 700 300 300
adb shell input swipe 300 700 300 300
adb shell input swipe 300 700 300 300
adb shell input tap 560 850 # Next ---

adb shell am force-stop com.hsv.privatebrowser




# 0 -->  "KEYCODE_UNKNOWN" 
# 1 -->  "KEYCODE_MENU" 
# 2 -->  "KEYCODE_SOFT_RIGHT" 
# 3 -->  "KEYCODE_HOME" 
# 4 -->  "KEYCODE_BACK" 
# 5 -->  "KEYCODE_CALL" 
# 6 -->  "KEYCODE_ENDCALL" 
# 7 -->  "KEYCODE_0" 
# 8 -->  "KEYCODE_1" 
# 9 -->  "KEYCODE_2" 
# 10 -->  "KEYCODE_3" 
# 11 -->  "KEYCODE_4" 
# 12 -->  "KEYCODE_5" 
# 13 -->  "KEYCODE_6" 
# 14 -->  "KEYCODE_7" 
# 15 -->  "KEYCODE_8" 
# 16 -->  "KEYCODE_9" 
# 17 -->  "KEYCODE_STAR" 
# 18 -->  "KEYCODE_POUND" 
# 19 -->  "KEYCODE_DPAD_UP" 
# 20 -->  "KEYCODE_DPAD_DOWN" 
# 21 -->  "KEYCODE_DPAD_LEFT" 
# 22 -->  "KEYCODE_DPAD_RIGHT" 
# 23 -->  "KEYCODE_DPAD_CENTER" 
# 24 -->  "KEYCODE_VOLUME_UP" 
# 25 -->  "KEYCODE_VOLUME_DOWN" 
# 26 -->  "KEYCODE_POWER" 
# 27 -->  "KEYCODE_CAMERA" 
# 28 -->  "KEYCODE_CLEAR" 
# 29 -->  "KEYCODE_A" 
# 30 -->  "KEYCODE_B" 
# 31 -->  "KEYCODE_C" 
# 32 -->  "KEYCODE_D" 
# 33 -->  "KEYCODE_E" 
# 34 -->  "KEYCODE_F" 
# 35 -->  "KEYCODE_G" 
# 36 -->  "KEYCODE_H" 
# 37 -->  "KEYCODE_I" 
# 38 -->  "KEYCODE_J" 
# 39 -->  "KEYCODE_K" 
# 40 -->  "KEYCODE_L" 
# 41 -->  "KEYCODE_M" 
# 42 -->  "KEYCODE_N" 
# 43 -->  "KEYCODE_O" 
# 44 -->  "KEYCODE_P" 
# 45 -->  "KEYCODE_Q" 
# 46 -->  "KEYCODE_R" 
# 47 -->  "KEYCODE_S" 
# 48 -->  "KEYCODE_T" 
# 49 -->  "KEYCODE_U" 
# 50 -->  "KEYCODE_V" 
# 51 -->  "KEYCODE_W" 
# 52 -->  "KEYCODE_X" 
# 53 -->  "KEYCODE_Y" 
# 54 -->  "KEYCODE_Z" 
# 55 -->  "KEYCODE_COMMA" 
# 56 -->  "KEYCODE_PERIOD" 
# 57 -->  "KEYCODE_ALT_LEFT" 
# 58 -->  "KEYCODE_ALT_RIGHT" 
# 59 -->  "KEYCODE_SHIFT_LEFT" 
# 60 -->  "KEYCODE_SHIFT_RIGHT" 
# 61 -->  "KEYCODE_TAB" 
# 62 -->  "KEYCODE_SPACE" 
# 63 -->  "KEYCODE_SYM" 
# 64 -->  "KEYCODE_EXPLORER" 
# 65 -->  "KEYCODE_ENVELOPE" 
# 66 -->  "KEYCODE_ENTER" 
# 67 -->  "KEYCODE_DEL" 
# 68 -->  "KEYCODE_GRAVE" 
# 69 -->  "KEYCODE_MINUS" 
# 70 -->  "KEYCODE_EQUALS" 
# 71 -->  "KEYCODE_LEFT_BRACKET" 
# 72 -->  "KEYCODE_RIGHT_BRACKET" 
# 73 -->  "KEYCODE_BACKSLASH" 
# 74 -->  "KEYCODE_SEMICOLON" 
# 75 -->  "KEYCODE_APOSTROPHE" 
# 76 -->  "KEYCODE_SLASH" 
# 77 -->  "KEYCODE_AT" 
# 78 -->  "KEYCODE_NUM" 
# 79 -->  "KEYCODE_HEADSETHOOK" 
# 80 -->  "KEYCODE_FOCUS" 
# 81 -->  "KEYCODE_PLUS" 
# 82 -->  "KEYCODE_MENU" 
# 83 -->  "KEYCODE_NOTIFICATION" 
# 84 -->  "KEYCODE_SEARCH" 
# 85 -->  "TAG_LAST_KEYCODE"
