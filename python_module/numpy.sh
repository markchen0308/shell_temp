#!/bin/bash
pip3 install --user cython
pip install --user cython
git clone https://github.com/numpy/numpy.git
cd numpy
python3 setup.py install --user
pyhton setup.py install --user
