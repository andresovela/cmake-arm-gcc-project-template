# This is similar to #pragma once
include_guard(GLOBAL)

# Sets the linker script to use for this project
set(LINKER_SCRIPT "${PROJECT_SOURCE_DIR}/STM32F446RETx_FLASH.ld")

set(LINKER_USE_CUSTOM_SCRIPT "-T ${LINKER_SCRIPT}")

# Includes libraries: Link the standard C Math library
set(LINKER_LIBRARY_FLAGS "-lm")

# Linker specs: When defined in this order, this results in -lnosys and -lc_nano
set(LINKER_SPEC_FILES "--specs=nano.specs --specs=nosys.specs")

# Linker options to make it generate a .map file
set(LINKER_GENERATE_MAP_FILE "-Wl,-Map=${PROJECT_NAME}.map,--cref")

# Linker flags common to all the build profiles
set(PROJECT_COMMON_LINKER_FLAGS " \
    -v \
    ${LINKER_GENERATE_MAP_FILE} \
    ${LINKER_LIBRARY_FLAGS} \
    ${LINKER_SPEC_FILES} \
    -Wl,--gc-sections \
    -T ${LINKER_SCRIPT} \
")
