#!/bin/bash
mkdir -p /tmp/b
cd /tmp/b
sudo apt-get install git build-essential cmake automake libtool autoconf libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential -y
git clone --single-branch -b linux https://github.com/tpruvot/ccminer.git
cd ccminer
./build.sh
echo '###################################################################'
echo '###################################################################'
echo '############################ xmCPU #################################'
echo '###################################################################'
echo '###################################################################'

#git clone https://github.com/cloud10001/xmrig.git
#mkdir xmrig/build && cd xmrig/scripts
#./build_deps.sh && cd ../build
#cmake .. -DXMRIG_DEPS=scripts/deps
#make -j$(nproc)

echo '###################################################################'
echo '###################################################################'
echo '############################ xmCUDA #################################'
echo '###################################################################'
echo '###################################################################'

#cd /tmp/b
#git clone https://github.com/cloud10001/xmrig-cuda.git
#mkdir xmrig-cuda/build && cd xmrig-cuda/build
#cmake .. -DCUDA_LIB=/usr/local/cuda/lib64/stubs/libcuda.so -DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda
#make -j$(nproc)


echo '###################################################################'
echo '###################################################################'
echo '############################ COMPRESS #############################'
echo '###################################################################'
echo '###################################################################'


tar -cJf /tmp/b.tar.xz  /tmp/b
