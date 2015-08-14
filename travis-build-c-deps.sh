#!/usr/bin/env bash
echo "Installing libmcp23s17 and libpifacedigital..."
set -ex
git clone https://github.com/piface/libmcp23s17.git
pushd libmcp23s17
make
sudo make install
popd
rm -rf libmcp23s17
git clone https://github.com/piface/libpifacedigital.git
pushd libpifacedigital
make
sudo make install
popd
rm -rf libpifacedigital
