# Starting point for the list of build profiles
set(BUILD_PROFILES "")

list(APPEND BUILD_PROFILES Debug)
list(APPEND BUILD_PROFILES Release)

# This should be defined before project() definitions
set(CMAKE_CONFIGURATION_TYPES ${BUILD_PROFILES} CACHE STRING "" FORCE)

if(NOT DEFINED CMAKE_BUILD_TYPE)
    message(FATAL_ERROR "CMAKE_BUILD_TYPE not defined, needed for build profile dependent compiler flags!")
endif()

# For every build configuration and language enabled, CMake automatically
# creates a CMAKE_<LANG>_FLAGS_<CONFIG> variable.
# The configuration specific flags for <CONFIG> are automatically appended
# to CMAKE_<LANG>_FLAGS if <CONFIG> is active.

include(${CMAKE_CURRENT_SOURCE_DIR}/_cmake/common_compiler_flags.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/_cmake/common_linker_flags.cmake)

# ----------------------------------------------------------------------
# Debug
# ----------------------------------------------------------------------

set(CMAKE_ASM_FLAGS_DEBUG " \
    ${PROJECT_COMMON_ASM_FLAGS} \
    -DDEBUG \
    -g \
")

set(CMAKE_C_FLAGS_DEBUG " \
    ${PROJECT_COMMON_C_FLAGS} \
    -DDEBUG \
    -g \
    -Og \
")

set(CMAKE_CXX_FLAGS_DEBUG " \
    ${PROJECT_COMMON_CXX_FLAGS} \
    -DDEBUG \
    -g \
    -Og \
")

set(CMAKE_EXE_LINKER_FLAGS_DEBUG " \
    ${PROJECT_COMMON_LINKER_FLAGS} \
")

# ----------------------------------------------------------------------
# Release
# ----------------------------------------------------------------------

set(CMAKE_ASM_FLAGS_RELEASE " \
    ${PROJECT_COMMON_ASM_FLAGS} \
")

set(CMAKE_C_FLAGS_RELEASE " \
    ${PROJECT_COMMON_C_FLAGS} \
    -Os \
")

set(CMAKE_CXX_FLAGS_RELEASE " \
    ${PROJECT_COMMON_CXX_FLAGS} \
    -Os \
")

set(CMAKE_EXE_LINKER_FLAGS_RELEASE " \
    ${PROJECT_COMMON_LINKER_FLAGS} \
")
