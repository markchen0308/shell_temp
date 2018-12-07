 locate libc.so.6
/usr/local/lib/python3.5/dist-packages$ locate libc.so.6
/lib/arm-linux-gnueabihf/libc.so.6
/usr/lib/arm-linux-gnueabihf/libc.so.6
strings /lib/arm-linux-gnueabihf/libc.so.6 | grep GLIBC

wget http://ftp.gnu.org/gnu/libc/glibc-2.24.tar.gz
cd glibc-2.24
mkdir build
cd build
../configure --prefix=/opt/glibc-2.24
make -j4 
sudo make install  
sudo gedit /etc/ld.so.conf.d/glibc-2.24.conf
#fill 
/opt/glibc-2.24/lib

sudo ldconfig
