cmake_minimum_required(VERSION 3.17)

project(test_x86 LANGUAGES C ASM)

# Use the x86 GCC toolchain rather than the ARM one
# This needs to be included _after_ the project call, otherwise this will
# cause CMake to loop trying to figure out stuff
include(${CMAKE_SOURCE_DIR}/cmake/toolchains/x86-gcc-toolchain.cmake)

enable_testing()
add_subdirectory(add_one)