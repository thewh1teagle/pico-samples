#!/bin/bash


# rm -rf build
mkdir -p build
pushd build
export PICO_BOARD=pico_w
export PICO_SDK_PATH=/home/user/pico-sdk
# git submodule update --init -- lib/cyw43-driver
cmake .. -DPICO_CYW43_SUPPORTED=1
make -j8
sudo mount -t drvfs E: /mnt/e
cp main.uf2 /mnt/e
popd
