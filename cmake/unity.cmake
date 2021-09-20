set(UNITY_ROOT_PATH ${CMAKE_SOURCE_DIR}/external/unity)

set(UNITY_SOURCE_FILES
    ${UNITY_ROOT_PATH}/src/unity.c
    ${UNITY_ROOT_PATH}/extras/fixture/src/unity_fixture.c
    ${UNITY_ROOT_PATH}/extras/memory/src/unity_memory.c
)

set(UNITY_INCLUDE_DIRECTORIES
    ${UNITY_ROOT_PATH}/src
    ${UNITY_ROOT_PATH}/extras/fixture/src
    ${UNITY_ROOT_PATH}/extras/memory/src
)