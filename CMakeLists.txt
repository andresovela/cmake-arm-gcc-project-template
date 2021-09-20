cmake_minimum_required(VERSION 3.17)

include(cmake/toolchains/arm-gcc-toolchain.cmake)

project(template)

# Variable that holds the directory that holds all the sources for this project
set(PATH_TO_PROJECT_SOURCES ${CMAKE_SOURCE_DIR}/src)

add_subdirectory(src)
add_subdirectory(tests)

set(UNITY_EXTENSION_FIXTURE ON CACHE BOOL "Compile Unity with the \"fixture\" extension")
add_subdirectory(external/unity)
