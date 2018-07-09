include(GoogleTest)
find_package(GTest REQUIRED)
enable_testing()

include_directories("${PROJECT_SOURCE_DIR}/plugin")

add_executable(AzureStorageTests StorageTest.cpp)
target_link_libraries(AzureStorageTests OrthancSqlServerStorage
                                        GTest::GTest)

gtest_add_tests(TARGET AzureStorageTests TEST_PREFIX azure:)
