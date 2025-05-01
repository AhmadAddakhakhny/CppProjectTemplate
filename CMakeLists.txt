cmake_minimum_required(VERSION 3.0.0)
project(CppProjectTemplate VERSION 1.0.0 LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD          17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS        OFF)

# Build config options
option(DEBUG_LOG "Enable debug logging" OFF)
option(CPM_ENABLED "Enable CPM to fetch GitHub Repos" OFF)

# CMake Includes
set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/")
include(execBashCommand)
include(CPM)    # Add third party CMake projects/submodules to the current prject

# Invoke User defined CMake Functions
set(GIT_COMMIT_SHA "")
execBashCommand("git rev-parse HEAD" GIT_COMMIT_SHA)

# Fetch content of the following submodules
if(CPM_ENABLED) 
# CPMAddPackage("gh:nlohmann/json#v3.12.0")
CPMAddPackage(
  NAME nlohmann_json
  GITHUB_REPOSITORY nlohmann/json
  VERSION 3.12.0
  DOWNLOAD_ONLY TRUE
)

file(COPY ${nlohmann_json_SOURCE_DIR} DESTINATION ${CMAKE_SOURCE_DIR}/external/json)
message(STATUS "################## Path to json: ${nlohmann_json_SOURCE_DIR}")
endif()

add_subdirectory(configured)
add_subdirectory(external)
add_subdirectory(app)
add_subdirectory(lib)