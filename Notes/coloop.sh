#!/bin/bash
PASS=*************
echo > coloop.log
cat $1 | while read email 
do
   ./newcolab.py $email $PASS 2>> coloop.log 1>> coloop.log &
   sleep 180
done
tail -f coloop.log
