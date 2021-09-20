include(CTest)

set(TEST_NAME add_one)
set(TEST_EXECUTABLE_NAME test_${TEST_NAME})

set(TEST_FILES
    ${TEMPLATE_SOURCE_DIR}/${TEST_NAME}/${TEST_NAME}.c
    ${TEST_EXECUTABLE_NAME}.c
)

# Declares all the source files in the ${SOURCE_FILES} variable
include(${CMAKE_SOURCE_DIR}/projects/app/cmake/source_files.cmake)

# Declares all the include paths in the ${INCLUDE_PATHS} variable
include(${CMAKE_SOURCE_DIR}/projects/app/cmake/include_directories.cmake)

add_executable(${TEST_EXECUTABLE_NAME} ${TEST_FILES})

target_include_directories(${TEST_EXECUTABLE_NAME} PUBLIC ${TEMPLATE_INCLUDE_DIRECTORIES})
target_link_libraries(${TEST_EXECUTABLE_NAME} unity)

add_test(NAME ${TEST_NAME} COMMAND ${TEST_EXECUTABLE_NAME} WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})