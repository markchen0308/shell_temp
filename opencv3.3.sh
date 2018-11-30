sudo apt-get autoremove
sudo apt-get install -y build-essential
sudo apt-get install -y cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install -y python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng16-dev libtiff-dev libjasper-dev libdc1394-22-dev
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt-get install -y libxvidcore-dev libx264-dev
sudo apt-get install -y libgtk-3-dev
sudo apt-get install -y libatlas-base-dev gfortran
sudo apt-get install -y python2.7-dev python3.5-dev

mkdir ~/opencv/opencv3.3
cd ~/opencv/opencv3.3
wget -O opencv.zip https://github.com/opencv/opencv/archive/3.3.0.zip
unzip opencv.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/3.3.0.zip
unzip opencv_contrib.zip
sudo apt-get install python-pip && pip install --upgrade pip
sudo pip install virtualenv virtualenvwrapper

# virtualenv and virtualenvwrapper
sudo sh -c  "echo 'export WORKON_HOME=$HOME/.virtualenvs' >> ~/.bashrc"
sudo sh -c  "echo 'source /usr/local/bin/virtualenvwrapper.sh' >> ~/.bashrc"


source ~/.bashrc
mkvirtualenv cv3 -p python3
workon cv3

cd ~/opencv/opencv3.3/opencv-3.3.0
mkdir build

cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D INSTALL_C_EXAMPLES=OFF \
      -D OPENCV_EXTRA_MODULES_PATH=~/opencv/opencv3.3/opencv_contrib-3.3.0/modules \
      -D PYTHON_EXECUTABLE=~/.virtualenvs/cv3/bin/python \
      -D BUILD_EXAMPLES=ON ..
sudo make -j6
sudo make install
sudo ldconfig
 sudo apt-get install libpng12-dev
