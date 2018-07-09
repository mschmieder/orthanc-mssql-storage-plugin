set(SOURCES SqlServerStorageException.h
            Configuration.h
            Configuration.cpp
            SqlServerStorageConnection.h
            SqlServerStorageConnection.cpp
            SqlServerStorageArea.h
            SqlServerStorageArea.cpp
            Plugin.cpp)

add_library(OrthancSqlServerStorage SHARED ${SOURCES})

target_link_libraries(OrthancSqlServerStorage 
                      Orthanc::Plugins
                      Qt5::Core
                      JsonCpp::JsonCppStatic)

include(GenerateExportHeader)
generate_export_header(OrthancSqlServerStorage)

target_include_directories(OrthancSqlServerStorage PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}>)

target_compile_definitions(OrthancSqlServerStorage
                           PRIVATE "-DSQL_SERVER_STORAGE_PLUGIN_VERSION=\"${SQL_SERVER_STORAGE_PLUGIN_VERSION}\"")

set_target_properties(OrthancSqlServerStorage PROPERTIES  VERSION   ${SQL_SERVER_STORAGE_PLUGIN_VERSION}
                                                         SOVERSION ${SQL_SERVER_STORAGE_PLUGIN_VERSION_MAJOR} )

install(TARGETS OrthancSqlServerStorage
        LIBRARY DESTINATION plugin
        ARCHIVE DESTINATION plugin)

install(FILES resources/sql-server-storage.json 
        DESTINATION "plugin")