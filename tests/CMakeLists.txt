cmake_minimum_required(VERSION 3.17)

project(test_x86 LANGUAGES C ASM)
set(TOOLCHAIN_BIN_DIR /usr/bin)

set(CMAKE_C_COMPILER /usr/bin/gcc)
set(CMAKE_ASM_COMPILER /usr/bin/gcc)
set(CMAKE_CXX_COMPILER /usr/bin/g++)

unset(CMAKE_C_FLAGS)
unset(CMAKE_CXX_FLAGS)
unset(CMAKE_ASM_FLAGS)

set(CMAKE_C_FLAGS "-Wall -std=gnu99 -D x86" CACHE INTERNAL "c compiler flags")

enable_testing()
add_subdirectory(add_one)