#!/bin/bash
LogFile=/tmp/atk.log
ErrLog=/tmp/atk.log
while true;
do
   /bin/kcolab 1>>$LogFile 2>>$ErrLog 
   sleep 10
   autokey 1>>$LogFile 2>>$ErrLog &
   sleep 10
   autokey-run -s autocpu
   sleep 86400
done
