#!/bin/bash
ErroListFile=$1


while read gid 
do
echo ++++++++++ cleaning $gid +++++++++++++++
docker stop gcloud-config-${gid}
docker container rm gcloud-config-${gid}

done < $ErroListFile

docker volume prune
