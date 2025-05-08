set(TEST_DUMMY "test.exe")
set(TEST_SOURCES "unitTestDemo.cpp")
set(TEST_INCLUDES "./")

add_executable(${TEST_DUMMY} ${TEST_SOURCES})
target_include_directories(${TEST_DUMMY} PUBLIC ${TEST_INCLUDES})
target_link_libraries(${TEST_DUMMY} GTest::GTest GTest::Main)
