cmake_minimum_required(VERSION 3.13)

# initialize the SDK based on PICO_SDK_PATH
# note: this must happen before project()
include(pico_sdk_import.cmake)

project(main)
set(PICO_BOARD pico_w)
# initialize the Raspberry Pi Pico SDK
pico_sdk_init()

# rest of your project

add_executable(main
    main.c
)


target_include_directories(main PRIVATE
    ${CMAKE_CURRENT_LIST_DIR} # For btstack config
    )

target_link_libraries(main
        pico_stdlib              # for core functionality
        pico_cyw43_arch_none     # we need Wifi to access the GPIO, but we don't need anything else
        )

 

# create map/bin/hex/uf2 file in addition to ELF.

pico_add_extra_outputs(main)
pico_enable_stdio_usb(main 1)


