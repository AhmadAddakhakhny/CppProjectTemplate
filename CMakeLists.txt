cmake_minimum_required(VERSION 3.0.0)
project(CppProjectTemplate VERSION 1.0.0 LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD             17)
set(CMAKE_CXX_STANDARD_REQUIRED    ON)
set(CMAKE_CXX_EXTENSIONS          OFF)
set(CMAKE_CXX_FLAGS_RELEASE     "-O3")
set(CMAKE_C_FLAGS_RELEASE       "-O3")
set(CMAKE_EXPORT_COMPILE_COMMANDS  ON)

# Build config options
option(DEBUG_LOG "Enable debug logging"                             OFF)
option(CPM_ENABLED "Enable CPM to fetch GitHub Repos"               OFF)
option(WARNINGS_ENABLED "Enable compiler warning flags"              ON)
option(WARNINGS_ENABLED_AS_ERR "Enable compiler warnings as error"   ON)
option(SANITIZER_ENABLED "Enable Address Sanitizer"                 OFF)
option(LTO_ENABLED "Enable Link Time Optimization"                   ON)
option(TEST_ENABLED "Enable build for Unit test"                    OFF)
option(CLANG-TIDY_ENABLED "Enable Clang-tidy for project lintting"  OFF)
option(ENABLE_CLANG_FORMAT"Enable clang-format to unify code style"  ON)
option(ENABLE_CMAKE_FORMAT"Enable cmake-format to unify code style"  ON)
# CMake Includes -----------------------------------------------------------------#
set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/")
include(execBashCommand)
include(CPM)    # Add third party CMake projects/submodules to the current prject
include(docs)
include(tools)
if(WARNINGS_ENABLED)
  include(warnings)
endif()

if(SANITIZER_ENABLED)
  include(sanitizer)
  add_sanitizer_flags()
endif()

if(LTO_ENABLED)
  include(LTO)
endif()

if(TEST_ENABLED)
  include(gtest)
endif()
#---------------------------------------------------------------------------------#

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

CPMAddPackage(
  NAME googletest
  GITHUB_REPOSITORY google/googletest
  VERSION 1.14.0
  DOWNLOAD_ONLY TRUE
)
file(COPY ${googletest_SOURCE_DIR} DESTINATION ${CMAKE_SOURCE_DIR}/external/googletest)
endif()

# add_cmake_format_target()
add_clang_format_target()

if(NOT TEST_ENABLED)
add_subdirectory(configured)
add_subdirectory(external)
  add_subdirectory(app)
  add_subdirectory(lib)
else()
  add_subdirectory(tests)
endif()
