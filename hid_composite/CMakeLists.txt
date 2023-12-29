cmake_minimum_required(VERSION 3.17)

set(PICO_BOARD pico_w)



include(${CMAKE_CURRENT_SOURCE_DIR}/../tinyusb/hw/bsp/family_support.cmake)


# gets PROJECT name for the example (e.g. <BOARD>-<DIR_NAME>)
family_get_project_name(PROJECT ${CMAKE_CURRENT_LIST_DIR})

project(${PROJECT} C CXX ASM)

# Checks this example is valid for the family and initializes the project
family_initialize_project(${PROJECT} ${CMAKE_CURRENT_LIST_DIR})
# Espressif has its own cmake build system
if(FAMILY STREQUAL "espressif")
  return()
endif()

add_executable(${PROJECT})

# Example source
target_sources(${PROJECT} PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/src/main.c
        ${CMAKE_CURRENT_SOURCE_DIR}/src/usb_descriptors.c
        )

# Example include
target_include_directories(${PROJECT} PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/src
        )
        
target_link_libraries(${PROJECT} PRIVATE
        pico_stdlib              # for core functionality
        pico_cyw43_arch_none     # we need Wifi to access the GPIO, but we don't need anything else
        )
# Configure compilation flags and libraries for the example without RTOS.
# See the corresponding function in hw/bsp/FAMILY/family.cmake for details.
family_configure_device_example(${PROJECT} noos)
# target_compile_options(${PROJECT} PRIVATE -Wno-sign-conversion -Werror=conversion)
target_compile_options(${PROJECT} PRIVATE -Wno-error=conversion -Wno-sign-conversion -Wno-unused-parameter)
# pico_enable_stdio_usb(${PROJECT} 1)