cmake_minimum_required(VERSION 3.17)

# Project name and languages
project(template_app LANGUAGES C ASM)

# Configures CMake to output every compiler command it executes
set(CMAKE_VERBOSE_MAKEFILE ON)

set(CMAKE_EXECUTABLE_SUFFIX .elf)

# Include other files that provide helper variable definitions
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/c_definitions.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/c_flags.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/source_files.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/include_directories.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/linker.cmake)

# This is just a variable to group all the source files to compile in this project
set(PROJECT_SOURCE_FILES
    ${CMAKE_CURRENT_SOURCE_DIR}/main.c      # The main.c for this project
    ${TEMPLATE_SOURCE_FILES}                # Defined in app/cmake/source_files.cmake
)

# Set the linker flags for this project
# Defined in app/cmake/linker.cmake
set(CMAKE_EXE_LINKER_FLAGS "${MCU_FLAGS} ${PROJECT_LINKER_FLAGS}")

# Set the compiler and assembler flags
# Defined in app/cmake/c_flags.cmake
set(CMAKE_C_FLAGS ${PROJECT_C_FLAGS})
set(CMAKE_ASM_FLAGS ${PROJECT_ASM_FLAGS})

# Defined in app/cmake/c_definitions.cmake
add_compile_definitions(${PROJECT_C_DEFINITIONS})

# Add the target of this project
add_executable(${PROJECT_NAME} ${PROJECT_SOURCE_FILES})

# Adds the include paths necessary for this project
# This needs to be below `add_executable` because that's the command that defines the target
target_include_directories(
    ${PROJECT_NAME} PUBLIC
    ${TEMPLATE_INCLUDE_DIRECTORIES}         # Defined in app/cmake/include_directories.cmake
)
