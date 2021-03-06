#!/bin/bash

#remember use command "sudo chmod +s install_basic.sh" to make the file can install file in administration role
username="pi"
installNodeJs="y"
installVScode="n"
installYarn="y"
installPostgresql="y"
installJava="n"


#get cpu architecture and save to cpuArchitecture
cpuArchitecture=`lscpu | awk -F':' '/Architecture/{print $2}' | sed 's/ //g'`
JAVA=""
if [ "$installNodeJs" = "y" ]
    then
    echo "Start to installing NodeJs"
    sudo apt-get update
    sudo apt-get install -y curl
    curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
    sudo apt-get update
    sudo apt-get install -y nodejs
    sudo npm install -g typescript@latest
    node -v
fi


if [ "$installYarn" = "y" ]
    then
    echo "Start to installing Yarn"
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt-get update
    sudo apt-get install -y yarn
    yarn -v
fi


#sudo -u postgres psql
#postgres=# ALTER USER postgres WITH PASSWORD 'postgres';  //modify password
#CREATE DATABASE IOT;
#press ctrl+ D to exit command mode
if [ "$installPostgresql" = "y" ]
    then
    echo "Start to installing Postgresql"
    sudo apt-get update
    sudo apt-get install -y postgresql postgresql-contrib
fi



if [ "$installVScode" = "y" ]
    then
    echo "Start to installing VScode"
	# ref https://code.headmelted.com/
	sudo apt-key add ./headmelted-code-oss-0CC3FD642696BFC8.pub.gpg 
    	sudo -s
    	. <( wget -O - https://code.headmelted.com/installers/apt.sh )
fi


if [ "$installJava" = "y" ]
    then
    echo "Start to installing Java"
    sudo  update
    sudo apt-get install -y default-jre
    sudo apt-get install -y default-jdk
    #get path of java
    PATHJAVA=`update-alternatives --config java | awk -F':' '{print $2}' | sed 's/bin\/java/bin/g' |sed 's/ //g'` 
    echo "PATHJAVA=$PATHJAVA"
    #save to environment variable JAVA_HOME 
    sudo sh -c  "echo 'JAVA_HOME=\"$PATHJAVA\"' >> /etc/environment"
    source /etc/environment
    cat /etc/environment
    sudo nano /etc/environment
 remove JAVA_HOME
 

 https://www.oracle.com/technetwork/java/javase/downloads/java-archive-javase8-2177648.html
sudo update-alternatives --display java
 sudo update-alternatives --remove "java" "/usr/lib/jvm/java-8-openjdk-armhf/jre/bin/java"
sudo update-alternatives --remove "javac" "/usr/lib/jvm/java-8-openjdk-armhf/bin/javac"
sudo update-alternatives --display java 
 java -version
cd /usr/lib/jvm
sudo rm -rf /usr/lib/jvm/java-8-openjdk-armhf/


sudo mkdir  /usr/lib/jvm/
sudo cp -r  jdk1.8.0_151/ /usr/lib/jvm/jdk1.8.0_151/
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.8.0_151/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.8.0_151/bin/javac" 1 


fi