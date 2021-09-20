# Sets the linker script to use for this project
set(LINKER_SCRIPT "${PROJECT_SOURCE_DIR}/STM32F446RETx_FLASH.ld")

set(LINKER_USE_CUSTOM_SCRIPT "-T ${LINKER_SCRIPT}")

# Includes libraries: Standard C, NoSys, Math
set(LINKER_LIBRARY_FLAGS "-lc -lnosys -lm")

# Linker options to make it generate a .map file
set(LINKER_GENERATE_MAP_FILE "-Wl,-Map=${PROJECT_NAME}.map,--cref")

set(PROJECT_LINKER_FLAGS
    "-v \
    ${LINKER_USE_CUSTOM_SCRIPT} \
    ${LINKER_GENERATE_MAP_FILE} \
    ${LINKER_LIBRARY_FLAGS} \
    -Wl,--gc-sections \
    --specs=nano.specs"
)