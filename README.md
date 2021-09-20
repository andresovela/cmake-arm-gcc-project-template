# CMake project template for ARM GCC projects

This is a template for ARM GCC-based projects that uses CMake as a build system and Unity as a testing framework. CTest also should work out-of-the-box.

**Note**: This template has only been tested on a Linux-based OS. It will definitely need some adjustments to work on Windows.

## Set up

- Clone the project recursively to clone the Unity submodule too.
- Rename the project in CMakeLists.txt by changing the `PROJECT_NAME_PREFIX` variable.
- Remove/replace source files as needed.
- Adjust the source files to compile in `cmake/source_files.cmake`.
- Adjust the include paths in `cmake/include_directories.cmake`.
- Adjust compilation/link settings in `src/_cmake/${file}.cmake`.

## Testing

Unit tests running on x86 should work out-of-the-box. Use one of the test directories as a template and adjust as needed.

Any IDE with a CMake/CTest plugin should be able to detect and run the unit tests.

This was tested on CLion and VS Code.

