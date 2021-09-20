set(MCU_INCLUDE_DIRECTORIES
    ${PATH_TO_PROJECT_SOURCES}/board
    ${PATH_TO_PROJECT_SOURCES}/stm32/Core/Inc
    ${PATH_TO_PROJECT_SOURCES}/stm32/Drivers/STM32F4xx_HAL_Driver/Inc
    ${PATH_TO_PROJECT_SOURCES}/stm32/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy
    ${PATH_TO_PROJECT_SOURCES}/stm32/Drivers/CMSIS/Device/ST/STM32F4xx/Include
    ${PATH_TO_PROJECT_SOURCES}/stm32/Drivers/CMSIS/Include
)

set(APP_INCLUDE_DIRECTORIES
    ${PATH_TO_PROJECT_SOURCES}/add_one
    ${PATH_TO_PROJECT_SOURCES}/add_two
)

set(PROJECT_INCLUDE_DIRECTORIES
    ${MCU_INCLUDE_DIRECTORIES}
    ${APP_INCLUDE_DIRECTORIES}
)