# Add a command to generate firmware in binary and hex format
function(objcopy_to_hex_bin target)
    add_custom_command(TARGET ${target} POST_BUILD
            COMMAND ${CMAKE_OBJCOPY} -O binary "$<TARGET_FILE:${target}>" "${target}.bin"
            COMMAND ${CMAKE_OBJCOPY} -O ihex "$<TARGET_FILE:${target}>" "${target}.hex"
            COMMENT "Generating binary and hex files..."
            )
endfunction()