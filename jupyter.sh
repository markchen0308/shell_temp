Python Prerequisites
Make sure that you have python3 and pip3 installed.

$ sudo apt install python3
$ sudo apt install python3-pip
Also install the IPython shell.

$ sudo apt install ipython3
$ pip3 install jupyter

#That installed the executables into ~/.local/bin/, which then needs to be added to the execution path.
sudo nano ~/.bashrc
#add follows
export PATH=$PATH:~/.local/bin/


source  ~/.bashrc


jupyter notebook
