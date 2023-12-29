#!/bin/bash

# Set variables
export PICO_BOARD=pico_w
export PICO_SDK_PATH=$(pwd)/pico-sdk

# rm -rf app/build
mkdir -p app/build
pushd app/build
cmake .. -DPICO_CYW43_SUPPORTED=1
make -j8
# sudo mount -t drvfs E: /mnt/e
# cp main.uf2 /mnt/e
popd
