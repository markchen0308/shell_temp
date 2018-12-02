#!/bin/bash
username="pi"
installNumpy="y"
installJupyter="y"
installScipy="y"
installMatplotlib="y"
installScikitImage="y"
installScikitLearn="y"
installIpython="y"
installPandas="y"

cd ~
cwd="python_module"
if [ -d "$cwd" ]
    then
    echo "directory $cwd is exist."
    cd $cwd
else
     echo "directory $cwd is not exist.Create it."
     cd ~
     mkdir python_module
fi




#check cython is exist
cythonExist=`python3 -m cython |& grep -q 'No module named' && echo 'n' || echo 'y'` 
if [ "$cythonExist" = "n" ]
   then 
   echo "Start to installing cython"
   pip3 install cython --user
else 
   echo "cython is exist"
fi


if [ "$installNumpy" = "y" ]
    then
    echo "Start to installing Numpy"
    cd ~
    cd $cwd
    git clone https://github.com/numpy/numpy.git
    cd numpy
    python3 setup.py install --user
fi





if [ "$installScipy" = "y" ]
    then
    echo "Start to installing Scipy"
    #cd ~
    #cd $cwd
    #git clone https://github.com/scipy/scipy.git
    #cd scipy
    #python3 setup.py install --user
    pip3 install jupyter --user
fi


if [ "$installMatplotlib" = "y" ]
    then
    echo "Start to installing Matplotlib"
    sudo apt-get install tcl-dev tk-dev python-tk python3-tk
    pip3 install pillow --user
    pip3 install matplotlib --user
    #cd ~
    #cd $cwd
    #git clone https://github.com/matplotlib/matplotlib.git
    #cd matplotlib
    #python3 setup.py install --user
    #sudo rm /usr/lib/arm-linux-gnueabihf/libc.so
    #sudo ln -s /lib/arm-linux-gnueabihf/libc.so.6 /usr/lib/arm-linux-gnueabihf/libc.so

    
fi


#check PyWavelets is exist
PyWaveletsExist=`python3 -m PyWavelets |& grep -q 'No module named' && echo 'n' || echo 'y'` 
if [ "$PyWaveletsExist" = "n" ]
   then 
   echo "Start to install PyWavelets"
   pip3 install PyWavelets --user
else 
   echo "PyWavelets is exist"
fi


if [ "$installScikitImage" = "y" ]
    then
    echo "Start to installing ScikitImage"
   # cd ~
   # cd $cwd
   # git clone https://github.com/scikit-image/scikit-image.git
   # cd scikit-image
   # python3 setup.py install --user
    pip3 install scikit-image --user

fi

if [ "$installScikitLearn" = "y" ]
    then
    echo "Start to installing ScikitLearn"
    cd ~
    cd $cwd
    git clone https://github.com/scikit-learn/scikit-learn.git
    cd scikit-learn
    python3 setup.py install --user
fi

if [ "$installIpython" = "y" ]
    then
    echo "Start to installing ipython"
    python3 install Ipython --user
fi

if [ "$installPandas" = "y" ]
    then
    echo "Start to installing Pandas"
    #cd ~
    #cd $cwd
    #git clone https://github.com/pandas-dev/pandas.git
    #cd pandas
    #python3 setup.py install --user
    python3 install pandas --user
fi

if [ "$installJupyter" = "y" ]
    then
    echo "Start to installing jupyter"
    pip3 install jupyter --user
    sudo sh -c  "echo 'export PATH="/home/pi/.local/bin:\$PATH"' >> ~/.bashrc"
fi













