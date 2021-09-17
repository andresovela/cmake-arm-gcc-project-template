# Ensures recreation of map file in incremental builds
function(reset_map_file target)
    # Adds command for recreating the .map file
    add_custom_command(
            OUTPUT ${PROJECT_NAME}.map
            COMMAND "${CMAKE_COMMAND}" -E rm -f ${PROJECT_NAME}.map
            COMMAND "${CMAKE_COMMAND}" -E touch ${PROJECT_NAME}.map
            COMMENT "Resetting ${PROJECT_NAME}.map file..."
    )

    # Add custom command to build dependencies to make the map file command known to make
    target_sources(${target} PUBLIC ${PROJECT_NAME}.map)

    # Adds .map file to dependencies of executable so that it gets rebuild only before linking
    set_target_properties(
            ${target}
            PROPERTIES
            LINK_DEPENDS ${PROJECT_BINARY_DIR}/${PROJECT_NAME}.map
    )
endfunction()