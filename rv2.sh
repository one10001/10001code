#!/bin/bash
mkdir -p /tmp/b
cd /tmp/b
sudo apt-get install git build-essential cmake automake libtool autoconf
git clone https://github.com/cloud10001/xmrig.git
mkdir xmrig/build && cd xmrig/scripts
./build_deps.sh && cd ../build
cmake .. -DXMRIG_DEPS=scripts/deps
make -j$(nproc)