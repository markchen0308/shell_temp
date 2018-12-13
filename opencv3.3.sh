sudo apt-get install -y build-essential checkinstall yasm
sudo apt-get install -y cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev
sudo apt-get install -y python-dev python-numpy libtbb2 libtbb-dev libjpeg8-dev libpng16-dev libtiff5-dev libjasper-dev 
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt-get install -y libxvidcore-dev libx264-dev
sudo apt-get install -y qtbase5-dev
sudo apt-get install -y libatlas-base-dev gfortran
sudo apt-get install -y libfaac-dev libmp3lame-dev libtheora-dev
sudo apt-get install -y libvorbis-dev libopencore-amrnb-dev libopencore-amrwb-dev
sudo apt-get install -y x264 v4l-utils
 sudo apt-get install -y libatlas-base-dev 
sudo apt-get install -y python2.7-dev python3.5-dev 
sudo apt install -y cmake
sudo apt-get install -y zlibc zlib1g zlib1g-dev
#sudo ln -s /lib/arm-linux-gnueabihf/libz.so.1 /usr/lib/arm-linux-gnueabihf/libz.so.1
 sudo ln -s /lib/arm-linux-gnueabihf/libz.so.1 /usr/lib/libz.so


#install libpng16-dev remove 
# libfontconfig1-dev libfreetype6-dev libpng12-dev libxft-dev tk-dev tk8.6-dev

#install pip3
curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
python3 get-pip.py --user

sudo apt-get install python-pip && pip install --upgrade pip
sudo pip install virtualenv virtualenvwrapper

# virtualenv and virtualenvwrapper
sudo sh -c  "echo 'export WORKON_HOME=$HOME/.virtualenvs' >> ~/.bashrc"
sudo sh -c  "echo 'source /usr/local/bin/virtualenvwrapper.sh' >> ~/.bashrc"

#install python package as python basic.sh

sudo apt-get install -y libpng-dev  libfreetype6-dev pkg-config
source ~/.bashrc

mkvirtualenv --system-site-packages  cv3 -p python3 
workon cv3
deactivate

#remove cv3 
#rmvirtualenv cv3


cd ~/opencv/opencv3.4_ubuntu16/opencv
rm -rf build
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


sudo cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D INSTALL_C_EXAMPLES=OFF \
      -D OPENCV_EXTRA_MODULES_PATH=~/opencv/opencv3.4_ubuntu16/opencv_contrib/modules \
      -D PYTHON_EXECUTABLE=~/.virtualenvs/cv3/bin/python \
      -D BUILD_EXAMPLES=ON ..

sudo make -j6
sudo make install
sudo sh -c  'echo "/usr/local/lib" >>  /etc/ld.so.conf.d/opencv.conf'
sudo gedit /etc/ld.so.conf.d/opencv.conf
/usr/local/lib

sudo ldconfig
 sudo apt-get install libpng12-dev






wget -O opencv.zip https://github.com/opencv/opencv/archive/3.4.1.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/3.4.1.zip
unzip opencv.zip
unzip opencv_contrib.zip
cd opencv-3.4.1
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
      -D OPENCV_EXTRA_MODULES_PATH=~/install/opencv_contrib-3.4.1/modules \
      -D PYTHON_LIBRARY=/usr/lib/python3.5 \
      -D PYTHON_DEFAULT_EXECUTABLE=/usr/bin/python3 \
      -D PYTHON_INCLUDE_DIRS=/usr/include \
      -D BUILD_EXAMPLES=ON ..

sudo make install
ln -s /usr/local/python/cv2/python-3.5/cv2.cpython-35m-arm-linux-gnueabihf.so /home/pi/.local/lib/python3.5/site-packages/cv2.so
sudo ldconfig


#x64 ubuntu18.04

cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D INSTALL_C_EXAMPLES=ON \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D WITH_TBB=ON \
      -D WITH_V4L=ON \
      -D WITH_QT=ON \
      -D WITH_OPENGL=ON \
      -D CUDA_NVCC_FLAGS=--expt-relaxed-constexpr \
      -D OPENCV_EXTRA_MODULES_PATH=~/Download/opencv_contrib-3.4.1/modules \
      -D PYTHON_LIBRARY=/usr/lib/python3.6 \
      -D PYTHON_DEFAULT_EXECUTABLE=/usr/bin/python3 \
      -D PYTHON_INCLUDE_DIRS=/usr/include \
      -D BUILD_EXAMPLES=ON ..

make -j6
sudo make install
sudo ldconfig
pkg-config --modversion opencv


