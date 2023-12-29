# Setup samples
https://github.com/thewh1teagle/pico-samples
cd pico-samples

# Setup SDK
sudo apt-get update -y
sudo apt install git cmake gcc-arm-none-eabi gcc g++ -y python3-pip

git clone https://github.com/raspberrypi/pico-sdk
git submodule update --init -- lib/cyw43-driver
git submodule update --init -- lib/tinyusb


# Pictool
git clone https://github.com/raspberrypi/picotool.git
sudo apt install build-essential pkg-config libusb-1.0-0-dev cmake
cd picotool
sudo cp udev/99-picotool.rules /etc/udev/rules.d/
mkdir -p build
cd build
export PICO_SDK_PATH=$(pwd)/../../pico-sdk
cmake ..
make -j8
cp picotool ../../bin 

# Develop
cd app/
mkdir build && cd build
cmake .. && make -j8 && ../../bin/picotool load -x main.uf2 -f