unset(CMAKE_C_COMPILER CACHE)
unset(CMAKE_CXX_COMPILER CACHE)

# Name used for Embedded targets on CMake
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR ARM)

# Helper definition
set(ARM_GCC_TOOLCHAIN_PREFIX arm-none-eabi-)

set(CMAKE_C_COMPILER    ${ARM_GCC_TOOLCHAIN_PREFIX}gcc)
set(CMAKE_ASM_COMPILER  ${ARM_GCC_TOOLCHAIN_PREFIX}gcc)
set(CMAKE_CXX_COMPILER  ${ARM_GCC_TOOLCHAIN_PREFIX}g++)
set(CMAKE_OBJCOPY       ${ARM_GCC_TOOLCHAIN_PREFIX}objcopy)
set(CMAKE_SIZE_UTIL     ${ARM_GCC_TOOLCHAIN_PREFIX}size)

# This avoids running the linker and is intended for use with
# cross-compiling toolchains that cannot link without custom flags or linker scripts
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
