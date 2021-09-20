cmake_minimum_required(VERSION 3.17)

project(test_x86 LANGUAGES C ASM)

# Use the x86 GCC toolchain rather than the ARM one
# This needs to be included _after_ the project call, otherwise this will
# cause CMake to loop trying to figure out stuff
include(${CMAKE_SOURCE_DIR}/cmake/toolchains/x86-gcc-toolchain.cmake)

# Declares some helper variables to compile Unity into every test
include(${CMAKE_SOURCE_DIR}/cmake/unity.cmake)

# This macro returns a list with all the subdirectories in a given directory
macro(SUBDIRLIST result curdir)
    file(GLOB children RELATIVE ${curdir} ${curdir}/*)
    set(dirlist "")
    foreach(child ${children})
        if(IS_DIRECTORY ${curdir}/${child})
            list(APPEND dirlist ${child})
        endif()
    endforeach()
    set(${result} ${dirlist})
endmacro()

# Get a list of all the directories in the current directory
SUBDIRLIST(SUBDIRS ${CMAKE_CURRENT_SOURCE_DIR})

# Add all subdirectories to CMake
foreach(subdir ${SUBDIRS})
    add_subdirectory(${subdir})
endforeach()
