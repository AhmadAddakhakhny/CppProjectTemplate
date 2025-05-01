set(LIB_SOURCES "printHello.cpp")
set(LIB_HEADERS "printHello.hpp")

add_library(LIB STATIC ${LIB_SOURCES} ${LIB_HEADERS})
target_include_directories(LIB PUBLIC "./")
target_link_libraries(LIB PUBLIC 
  nlohmann_json::nlohmann_json)