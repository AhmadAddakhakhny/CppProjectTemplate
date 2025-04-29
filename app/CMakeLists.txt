set(APP_SOURCES "main.cpp")
add_executable(app.exe ${APP_SOURCES})

target_link_libraries(app.exe PUBLIC LIB)