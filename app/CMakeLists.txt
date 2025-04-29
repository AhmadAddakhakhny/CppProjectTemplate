set(APP_SOURCES "main.cpp")
add_executable(app.exe ${APP_SOURCES})

target_link_libraries(app.exe PUBLIC LIB)

# Target include files paths shall be passed to this function
target_include_directories(app.exe PRIVATE "${CMAKE_BINARY_DIR}/configured_files/include")