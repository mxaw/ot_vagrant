#!/bin/bash
#

sudo apt-get install -y git
mkdir src
cd src
# clone opentransactions-proto
git clone https://github.com/Open-Transactions/opentxs-proto.git

# install dependencies for opentxs-proto
sudo apt-get install -y libprotobuf-dev
sudo apt-get install -y cmake
sudo apt-get install -y g++
sudo apt-get install -y protobuf-compiler

# build opentransactions-proto
cd opentxs-proto
mkdir build
cd build
cmake ..
make
sudo make install

# clone libczmq
cd ~/src
git clone https://github.com/zeromq/czmq.git
sudo apt-get install -y libtool
sudo apt-get install -y automake
sudo apt-get install -y libzmq-dev
cd czmq
sh autogen.sh
./configure
make all
sudo make install
sudo ldconfig

# clone opentransactions
git clone https://github.com/Open-Transactions/opentxs.git
sudo apt-get install -y sqlite3
sudo apt-get install -y libopenssl-dev
sudo apt-get install -y libnacl-dev
sudo apt-get install -y libsodium-dev
sudo apt-get install -y libgmp-dev
sudo apt-get install -y pkg-config
sudo apt-get install -y graphviz graphviz-dev
sudo apt-get install -y doxygen
sudo apt-get install -y libsqlite3-dev
sudo apt-get install -y libssl-dev
cd opentxs 
mkdir build
cd build
cmake ..
make
