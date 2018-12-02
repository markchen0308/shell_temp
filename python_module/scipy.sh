#!/bin/bash
git clone https://github.com/scipy/scipy.git
cd scipy
python3 setup.py install --user
pyhton setup.py install --user