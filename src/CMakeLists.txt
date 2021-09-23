cmake_minimum_required(VERSION 3.17)

# Project name and languages
project(${PROJECT_NAME_PREFIX}_app LANGUAGES C ASM)

# Configures CMake to output every compiler command it executes
set(CMAKE_VERBOSE_MAKEFILE ON)

set(CMAKE_EXECUTABLE_SUFFIX .elf)

# Include other files that provide helper variable definitions
include(${CMAKE_SOURCE_DIR}/cmake/source_files.cmake)
include(${CMAKE_SOURCE_DIR}/cmake/include_directories.cmake)

# Include build profiles that configure compiler and linker flags
include(${CMAKE_CURRENT_SOURCE_DIR}/_cmake/build_profiles.cmake)

# Add the target of this project
add_executable(${PROJECT_NAME} ${PROJECT_SOURCE_FILES})

# Reset the map file on incremental compilations too
include(${CMAKE_SOURCE_DIR}/cmake/pre_build/reset_map_file.cmake)
reset_map_file(${PROJECT_NAME})

# Generate .hex and .bin files from .elf file
include(${CMAKE_SOURCE_DIR}/cmake/post_build/objcopy_to_hex_bin.cmake)
objcopy_to_hex_bin(${PROJECT_NAME})

# Print the firmware size after compilation
include(${CMAKE_SOURCE_DIR}/cmake/post_build/report_firmware_size.cmake)
report_firmware_size(${PROJECT_NAME})

# Adds the include paths necessary for this project
# This needs to be below `add_executable` because that's the command that defines the target
target_include_directories(
    ${PROJECT_NAME} PUBLIC
    ${PROJECT_INCLUDE_DIRECTORIES}         # Defined in cmake/include_directories.cmake
)
