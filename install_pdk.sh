#!/bin/sh -f

sudo apt -y install yosys

git clone git://opencircuitdesign.com/open_pdks
cd open_pdks
./configure --enable-sky130-pdk 
sudo make
sudo make install 
cd ..
