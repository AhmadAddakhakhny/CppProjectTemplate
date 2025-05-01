cmake_minimum_required(VERSION 3.0.0)
project(CppProjectTemplate VERSION 1.0.0 LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD          17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS        OFF)

# Build config options
option(DEBUG_LOG "Enable debug logging" OFF)

# CMake Includes
set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/")
include(execBashCommand)

# Invoke User defined CMake Functions
set(GIT_COMMIT_SHA "")
execBashCommand("git rev-parse HEAD" GIT_COMMIT_SHA)

add_subdirectory(configured)
add_subdirectory(app)
add_subdirectory(lib)