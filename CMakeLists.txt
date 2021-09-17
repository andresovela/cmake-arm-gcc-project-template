cmake_minimum_required(VERSION 3.17)

include(cmake/arm-gcc-toolchain.cmake)

project(template)

# Variable that holds the directory that holds all the sources for this project
set(TEMPLATE_SOURCE_DIR ${CMAKE_SOURCE_DIR}/src)

add_subdirectory(projects/app)
