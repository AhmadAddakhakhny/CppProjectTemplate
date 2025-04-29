set(LIB_SOURCES "printHello.cpp")
set(LIB_HEADERS "printHello.hpp")

add_library(LIB ${LIB_SOURCES} ${LIB_HEADERS})
target_include_directories(LIB PUBLIC "./")