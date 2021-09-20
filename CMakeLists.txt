cmake_minimum_required(VERSION 3.17)

include(cmake/toolchains/arm-gcc-toolchain.cmake)

project(template)

# Variable that holds the directory that holds all the sources for this project
set(PATH_TO_PROJECT_SOURCES ${CMAKE_SOURCE_DIR}/src)

# CMake project to cross-compile application
add_subdirectory(src)

# CMake project to test app modules on the PC
enable_testing()
add_subdirectory(tests)
