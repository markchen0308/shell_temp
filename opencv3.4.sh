#!/bin/bash

sudo apt-get install -y build-essential checkinstall yasm
sudo apt-get install -y cmake git libgtk3.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev
sudo apt-get install -y python-dev python-numpy libtbb2 libtbb-dev libjpeg8-dev libpng16-dev libtiff5-dev libjasper-dev 
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt-get install -y libxvidcore-dev libx264-dev
sudo apt-get install -y libgtk-3-dev qt5-default 
sudo apt-get install -y libatlas-base-dev gfortran
sudo apt-get install -y libfaac-dev libmp3lame-dev libtheora-dev
sudo apt-get install -y libvorbis-dev libopencore-amrnb-dev libopencore-amrwb-dev
sudo apt-get install -y x264 v4l-utils
sudo apt-get install -y python2.7-dev python3.5-dev 
sudo apt install -y cmake
apt-get install zlibc zlib1g zlib1g-dev
#sudo ln -s /lib/arm-linux-gnueabihf/libz.so.1 /usr/lib/arm-linux-gnueabihf/libz.so.1
 sudo ln -s /lib/arm-linux-gnueabihf/libz.so.1 /usr/lib/libz.so



cd ~/opencv/opencv3.4_ubuntu16/opencv
sudo rm -rf build
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D INSTALL_C_EXAMPLES=ON \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D WITH_TBB=ON \
      -D WITH_V4L=ON \
      -D WITH_QT=ON \
      -D WITH_OPENCL=ON \
      -D OPENCV_EXTRA_MODULES_PATH=~/opencv/opencv3.4_ubuntu16/opencv_contrib/modules \
      -D PYTHON_DEFAULT_EXECUTABLE=$HOME/.virtualenvs/cv3/bin/python3.5 \
      -D PYTHON_INCLUDE_DIRS=$HOME/.virtualenvs/cv3/include/python3.5m \
      -D PYTHON_EXECUTABLE=$HOME/.virtualenvs/cv3/bin/python3.5 \
      -D PYTHON_LIBRARY=/usr/lib/arm-linux-gnueabihf/libpython3.5m.so.1 \
      -D BUILD_EXAMPLES=ON ..

sudo make -j6
sudo make install
ln -s /usr/local/python/cv2/python-3.5/cv2.cpython-35m-arm-linux-gnueabihf.so /home/pi/.virtualenvs/cv3/lib/python3.5/site-packages/cv2.so
ln -s /usr/local/python/cv2/python-3.5/cv2.cpython-35m-arm-linux-gnueabihf.so /home/pi/.local/lib/python3.5/site-packages/cv2.so

workon cv3
python3
import cv2
cv2.__version__