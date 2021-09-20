include(CTest)

set(TEST_NAME add_one)
set(TEST_EXECUTABLE_NAME test_${TEST_NAME})

set(TEST_FILES
    ${PATH_TO_PROJECT_SOURCES}/${TEST_NAME}/${TEST_NAME}.c
    ${TEST_EXECUTABLE_NAME}.c
)

# Declares all the source files in modularized ${XXX_SOURCE_FILES} variable
# Generally we are only interested in ${APP_SOURCE_FILES} for unit testing
include(${CMAKE_SOURCE_DIR}/cmake/source_files.cmake)

# Declares all the include paths in modularized ${XXX_INCLUDE_DIRECTORIES} variable
# Generally we are only interested in ${APP_INCLUDE_DIRECTORIES} for unit testing
include(${CMAKE_SOURCE_DIR}/cmake/include_directories.cmake)

add_executable(${TEST_EXECUTABLE_NAME} ${TEST_FILES} ${UNITY_SOURCE_FILES})

target_include_directories(${TEST_EXECUTABLE_NAME} PUBLIC ${APP_INCLUDE_DIRECTORIES} ${UNITY_INCLUDE_DIRECTORIES})

add_test(NAME ${TEST_NAME} COMMAND ${TEST_EXECUTABLE_NAME} WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})