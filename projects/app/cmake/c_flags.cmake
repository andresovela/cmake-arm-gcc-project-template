# This is microcontroller specific
# Adjust accordingly
set(CPU_FLAG "-mcpu=cortex-m4")
set(FPU_FLAG "-mfpu=fpv4-sp-d16")
set(FLOAT_ABI_FLAG "-mfloat-abi=hard")


set(MCU_FLAGS
    "${CPU_FLAG} -mthumb ${FPU_FLAG} ${FLOAT_ABI_FLAG}"
)

# Optimization level
# -O0, -O1, -O2, -O3, -Os, -Og
set(OPTIMIZATION_LEVEL_FLAG "-Os")

# Flags common to the C compiler and the assembler
set(COMMON_FLAGS
    "${MCU_FLAGS} \
    ${OPTIMIZATION_LEVEL_FLAG} \
    -ffunction-sections -fdata-sections -fno-strict-aliasing -fno-builtin -fshort-enums \
    -g3 -Wall"
)

set(PROJECT_C_FLAGS
    "${COMMON_FLAGS}"
)

set(PROJECT_ASM_FLAGS
    "${COMMON_FLAGS} \
    -x assembler-with-cpp"
)