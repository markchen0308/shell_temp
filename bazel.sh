 
 sudo nano /etc/environment
 remove JAVA_HOME
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


wget https://github.com/bazelbuild/bazel/releases/download/0.9.0/bazel-0.9.0-dist.zip -O bazel.zip
unzip -d bazel bazel.zip
cd bazel
gedit scripts/bootstrap/compile.sh
run "${JAVAC}" -classpath "${classpath}" -sourcepath "${sourcepath}" \
      -d "${output}/classes" -source "$JAVA_VERSION" -target "$JAVA_VERSION" \
      -encoding UTF-8 "@${paramfile}" -J-Xmx500M


 ./compile.sh

sudo cp output/bazel /usr/local/bin/bazel



#install package
sudo apt-get install swig
pip3 install wheel --user

git clone --recurse-submodules https://github.com/tensorflow/tensorflow.git
cd tensorflow
git checkout v1.4.1
grep -Rl 'lib64' | xargs sed -i 's/lib64/lib/g'

#get uid
sudo blkid 
#write uuid
sudo nano /etc/fstab
UUID=XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX none swap sw,pri=5 0 0

 sudo swapon -a  #enable swap

 

 sudo gedit tensorflow/workspace.bzl

 native.new_http_archive(
      name = "eigen_archive",
      urls = [
          "http://mirror.bazel.build/bitbucket.org/eigen/eigen/get/d781c1de9834.tar.gz",
          "https://bitbucket.org/eigen/eigen/get/d781c1de9834.tar.gz",
      ],
      sha256 = "a34b208da6ec18fa8da963369e166e4a368612c14d956dd2f9d7072904675d9b",
      strip_prefix = "eigen-eigen-d781c1de9834",
      build_file = str(Label("//third_party:eigen.BUILD")),
  )


#build
bazel build -c opt --copt="-mfpu=neon-vfpv4" --copt="-funsafe-math-optimizations" --copt="-ftree-vectorize" --copt="-fomit-frame-pointer" --local_resources 1024,1.0,1.0 --verbose_failures --incompatible_load_argument_is_label=false tensorflow/tools/pip_package:build_pip_package
#package
bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg
#install
sudo pip3 install /tmp/tensorflow_pkg/tensorflow-1.4.1-cp35-cp35m-linux_armv7l.whl
#disable swap
sudo swapoff /dev/sdb1
#delete uuid
sudo nano /etc/fstab
