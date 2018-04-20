
export NODE_VERSION=6.10.3
export OPENCV_VERSION=2.4.13.5
export DIR=`pwd`
export LOCAL_SRC=$DIR/opencv_src
export OPENCV_RELEASE=${LOCAL_SRC}/opencv-${OPENCV_VERSION}/release
export OPENCV_INSTALL_PREFIX=${DIR}/build

sudo apt-get update
sudo apt-get install -y build-essential cmake libgtk2.0-dev pkg-config \
                        python-numpy python-dev libavcodec-dev libavformat-dev \
                        libswscale-dev libjpeg-dev libpng12-dev libtiff5-dev \
                        libjasper-dev libopencv-dev checkinstall pkg-config \
                        yasm libjpeg-dev libjasper-dev libavcodec-dev \
                        libavformat-dev libswscale-dev libdc1394-22-dev \
                        libxine2 libgstreamer0.10-dev  libv4l-dev \
                        libgstreamer-plugins-base0.10-dev python-dev \
                        python-numpy libtbb-dev libqt4-dev libgtk2.0-dev \
                        libmp3lame-dev libopencore-amrnb-dev \
                        libopencore-amrwb-dev libtheora-dev libvorbis-dev \
                        libxvidcore-dev x264 v4l-utils

### Download opencv-2.4.13.5
mkdir -p ${OPENCV_RELEASE}
mkdir -p ${OPENCV_INSTALL_PREFIX}
cd ${LOCAL_SRC}
wget https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip
unzip ${OPENCV_VERSION}.zip
cd ${OPENCV_RELEASE}

### Compile and install
cmake\
 -D CMAKE_BUILD_TYPE=RELEASE\
 -D WITH_IPP=ON\
 -D INSTALL_CREATE_DISTRIB=ON\
 -D BUILD_SHARED_LIBS=NO\
 -D CMAKE_INSTALL_PREFIX=${OPENCV_INSTALL_PREFIX}\
 ..

make
make install

cd ${LOCAL_SRC}
rm ${OPENCV_VERSION}.zip
rm -rf opencv-${OPENCV_VERSION}

