# Include guard similar to #pragma once
include_guard(GLOBAL)

# This is microcontroller specific
# Adjust accordingly
set(CPU_FLAG "-mcpu=cortex-m4")
set(FPU_FLAG "-mfpu=fpv4-sp-d16")
set(FLOAT_ABI_FLAG "-mfloat-abi=hard")

set(MCU_FLAGS
    "${CPU_FLAG} -mthumb ${FPU_FLAG} ${FLOAT_ABI_FLAG}"
)


# Flags common to the C compiler, the assembler and the linker
set(COMMON_FLAGS "\
    ${MCU_FLAGS} \
    -ffunction-sections -fdata-sections -fno-strict-aliasing -fno-builtin -ffreestanding -fno-common \
    -Wall \
")

# C flags common to all build profiles
set(PROJECT_COMMON_C_FLAGS "\
    ${COMMON_FLAGS} -MP -MMD -std=gnu99 \
    -DUSE_HAL_DRIVER \
    -DSTM32F446xx \
")

# CXX flags common to all build profiles
set(PROJECT_COMMON_CXX_FLAGS "\
    ${COMMON_FLAGS} \
    -fno-rtti -fno-exceptions \
    -DUSE_HAL_DRIVER \
    -DSTM32F446xx \
")

# ASM flags common to all build profiles
set(PROJECT_COMMON_ASM_FLAGS " \
    ${COMMON_FLAGS} -std=gnu99 \
    -DUSE_HAL_DRIVER \
    -DSTM32F446xx \
    -x assembler-with-cpp \
")
