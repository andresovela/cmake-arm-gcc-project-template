cmake_minimum_required(VERSION 3.17)

# Use the ARM GCC toolchain by default
# The toolchain is overridden for unit tests builds
include(cmake/toolchains/arm-gcc-toolchain.cmake)

# This variable is used to set the project name to ${PREFIX}_app
set(PROJECT_NAME_PREFIX template)

# Root CMake project
project(${PROJECT_NAME_PREFIX})

# Variable that holds the directory that holds all the sources for this project
set(PATH_TO_PROJECT_SOURCES ${CMAKE_SOURCE_DIR}/src)

# CMake project to cross-compile application
add_subdirectory(src)

# CMake project to test app modules on the PC
enable_testing()
add_subdirectory(tests)
