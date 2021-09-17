# Add custom command to print firmware size in Berkeley format
function(report_firmware_size target)
    add_custom_command(TARGET ${target} POST_BUILD
            COMMAND ${CMAKE_SIZE_UTIL} -B "$<TARGET_FILE:${target}>"
            COMMENT "Reporting size for target ${target}:"
            )
endfunction()