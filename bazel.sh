 
 

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
UUID=3683135b-b251-4343-86d8-73e5e5806ef6 none swap sw,pri=5 0 0

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

./configure
Please specify the location of python. [Default is /usr/bin/python]: /usr/bin/python3


Found possible Python library paths:
  /usr/local/lib/python3.5/dist-packages
  /usr/lib/python3/dist-packages
Please input the desired Python library path to use.  Default is [/usr/local/lib/python3.5/dist-packages]

Do you wish to build TensorFlow with jemalloc as malloc support? [Y/n]: Y
jemalloc as malloc support will be enabled for TensorFlow.
Do you wish to build TensorFlow with Google Cloud Platform support? [Y/n]: n
No Google Cloud Platform support will be enabled for TensorFlow.

Do you wish to build TensorFlow with Hadoop File System support? [Y/n]: n
No Hadoop File System support will be enabled for TensorFlow.

Do you wish to build TensorFlow with Amazon S3 File System support? [Y/n]: n
No Amazon S3 File System support will be enabled for TensorFlow.



#build
bazel build -c opt --copt="-mfpu=neon-vfpv4" --copt="-funsafe-math-optimizations" --copt="-ftree-vectorize" --copt="-fomit-frame-pointer" --local_resources 1024,1.0,1.0 --verbose_failures --incompatible_load_argument_is_label=false tensorflow/tools/pip_package:build_pip_package
#package
bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg
#install
sudo pip3 install /tmp/tensorflow_pkg/tensorflow-1.4.1-cp35-cp35m-linux_armv7l.whl --user
#disable swap
sudo swapoff /dev/sdb1
#delete uuid
sudo nano /etc/fstab
