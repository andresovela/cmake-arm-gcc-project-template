cmake_minimum_required(VERSION 3.17)

include(cmake/arm-gcc-toolchain.cmake)

project(template)

# Variable that holds the directory that holds all the sources for this project
set(TEMPLATE_SOURCE_DIR ${CMAKE_SOURCE_DIR}/src)

add_subdirectory(projects/app)
add_subdirectory(tests)

#cmake_policy(SET CMP0077 NEW)
set(UNITY_EXTENSION_FIXTURE ON CACHE BOOL "Compile Unity with the \"fixture\" extension")
add_subdirectory(external/unity)
