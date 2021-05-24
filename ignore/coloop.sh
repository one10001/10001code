#!/bin/bash
PASS=*************
cat $1 | while read email 
do
   ./newcolab.py $email $PASS 2>> coloop.log 1>> coloop.log &
   sleep 380
done
tail -f coloop.log
