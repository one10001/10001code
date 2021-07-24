#!/bin/bash
echo '######  AutoLumch 0.1  #######'
echo > /tmp/autolunch.log 
FileGIDs="file"

/usr/bin/google-chrome-stable --incognito --start-maximized %U
autokey-run -l 0colab
