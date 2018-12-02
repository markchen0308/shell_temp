#!/bin/bash


moduleExist=`python3 -m cython |& grep -q 'No module named' && echo 'n' || echo 'y'` 
echo "cython=$moduleExist"

