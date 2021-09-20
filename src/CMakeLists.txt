cmake_minimum_required(VERSION 3.17)

# Project name and languages
project(template_app LANGUAGES C ASM)

# Configures CMake to output every compiler command it executes
set(CMAKE_VERBOSE_MAKEFILE ON)

set(CMAKE_EXECUTABLE_SUFFIX .elf)

# Include other files that provide helper variable definitions
include(${CMAKE_SOURCE_DIR}/cmake/source_files.cmake)
include(${CMAKE_SOURCE_DIR}/cmake/include_directories.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/_cmake/c_definitions.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/_cmake/c_flags.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/_cmake/linker.cmake)

# This is just a variable to group all the source files to compile in this project
set(ALL_SOURCE_FILES
    ${CMAKE_CURRENT_SOURCE_DIR}/main.c      # The main.c for this project
    ${PROJECT_SOURCE_FILES}                 # Defined in cmake/source_files.cmake
)

# Set the linker flags for this project
# Defined in app/_cmake/linker._cmake
set(CMAKE_EXE_LINKER_FLAGS "${MCU_FLAGS} ${PROJECT_LINKER_FLAGS}")

# Set the compiler and assembler flags
# Defined in app/_cmake/c_flags._cmake
set(CMAKE_C_FLAGS ${PROJECT_C_FLAGS})
set(CMAKE_ASM_FLAGS ${PROJECT_ASM_FLAGS})

# Defined in app/_cmake/c_definitions._cmake
add_compile_definitions(${PROJECT_C_DEFINITIONS})

# Add the target of this project
add_executable(${PROJECT_NAME} ${ALL_SOURCE_FILES})

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
