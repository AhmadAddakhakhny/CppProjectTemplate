cmake_minimum_required(VERSION 3.0.0)
project(CppProjectTemplate VERSION 1.0.0 LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD          17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS        OFF)

option(DEBUG_LOG "Enable debug logging" OFF)

add_subdirectory(configured)
add_subdirectory(app)
add_subdirectory(lib)