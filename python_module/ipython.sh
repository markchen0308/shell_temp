#!/bin/bash
pip3 install --user cython
git clone https://github.com/ipython/ipython.git
cd ipython
python3 setup.py install --user
