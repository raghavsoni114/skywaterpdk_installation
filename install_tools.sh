#!/bin/sh -f

mkdir -p tools
cd tools

export START_PWD=$PWD
echo "Installing dependencies."

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y vim htop git
sudo apt-get install -y build-essential htop
sudo apt-get install -y libtool automake autoconf flex bison texinfo
sudo apt-get install -y libx11-dev libxaw7-dev libreadline-dev
sudo apt-get install -y m4 vim tcl-dev tk-dev libglu1-mesa-dev freeglut3-dev mesa-common-dev tcsh csh libx11-dev libcairo2-dev libncurses-dev
sudo apt-get install -y python3 python3-pip libgsl-dev libgtk-3-dev cmake
sudo apt-get install -y build-essential clang bison flex \
	libreadline-dev gawk tcl-dev libffi-dev git \
	graphviz xdot pkg-config python3 libboost-system-dev \
	libboost-python-dev libboost-filesystem-dev zlib1g-dev

sudo apt-get install -y gengetopt help2man groff pod2pdf bison flex libhpdf-dev libtool autoconf octave liboctave-dev epstool transfig paraview
sudo apt-get install -y libhdf5-dev libvtk7-dev libboost-all-dev libcgal-dev libtinyxml-dev qtbase5-dev libvtk7-qt-dev
sudo apt-get install -y octave liboctave-dev
sudo apt-get install -y gengetopt help2man groff pod2pdf bison flex libhpdf-dev libtool
sudo apt-get install -y libopenmpi-dev
sudo apt install -y xterm graphicsmagick ghostscript
sudo apt install -y libtinyxml-dev libhdf5-serial-dev libcgal-dev vtk6 libvtk6-qt-dev
sudo apt install -y cython3 build-essential cython3 python3-numpy python3-matplotlib
sudo apt install -y python3-scipy python3-h5py

echo "## Installing tools"
echo "# Installing ngspice"
git clone git://git.code.sf.net/p/ngspice/ngspice
cd ngspice
mkdir release
cd release
../configure --with-x --enable-xspice --enable-cider --enable-openmp --with-readlines=yes --disable-debug
make
sudo make install
cd $START_PWD

cd ngspice
mkdir build-lib
cd build-lib
../configure --with-x --enable-xspice --enable-cider --enable-openmp --disable-debug --with-ngshared
make
sudo make install
cd $START_PWD

echo "# Installing ngspice complete."
echo "# Installing magic"
git clone git://opencircuitdesign.com/magic
cd magic
./configure
make
sudo make install
cd $START_PWD

echo "# Installing xschem"
git clone https://github.com/StefanSchippers/xschem.git
cd xschem
./configure
make -j$(nproc)
sudo make install
cd $START_PWD
