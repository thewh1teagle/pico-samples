# Setup samples

```console
git clone https://github.com/thewh1teagle/pico-samples
cd pico-samples
```

# Setup SDK

```console
sudo apt-get update -y
sudo apt install git cmake gcc-arm-none-eabi gcc g++ -y python3-pip
```

```console
git clone https://github.com/raspberrypi/pico-sdk
git submodule update --init -- lib/cyw43-driver
git submodule update --init -- lib/tinyusb
```


# Pictool
```console
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
```

# Pico Examples
```console
git clone https://github.com/raspberrypi/pico-examples.git
cd pico-examples
```

# TinyUSB
```console
git clone https://github.com/hathach/tinyusb.git
cmake .. -DFAMILY=rp2040 && make -j8 && /home/user/pico/pico-samples/bin/picotool load -x hid_generic_inout.uf2 -f
```

# Develop
```console
mkdir -p app/build
cd app/build
cmake .. && make -j8 && ../../bin/picotool load -x main.uf2 -f
```