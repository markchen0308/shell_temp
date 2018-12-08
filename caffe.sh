sudo apt-get install -y libprotobuf-dev libleveldb-dev libsnappy-dev  libhdf5-serial-dev protobuf-compiler
sudo apt-get install --no-install-recommends libboost-all-dev
sudo apt-get install -y libopenblas-dev liblapack-dev libatlas-base-dev
sudo apt-get install -y  libgflags-dev libgoogle-glog-dev liblmdb-dev

git clone https://github.com/BVLC/caffe

cd caffe

gedit CMakeLists.txt
cmake ..
sudo make -j4
sudo make install



