find_path(Orthanc_DIR
          NAMES
          Plugins/Include/orthanc/OrthancCDatabasePlugin.h
          Plugins/Include/orthanc/OrthancCppDatabasePlugin.h
          Plugins/Include/orthanc/OrthancCPlugin.h
          HINTS ${ORTHANC_ROOT} ${ORTHANC_ROOT_DIR})

if(Orthanc_DIR)
  set(ORTHANC_PLUGINS_INCLUDE_DIR "${Orthanc_DIR}/Plugins/Include/")
  
  add_library(Orthanc::Plugins INTERFACE IMPORTED)
  set_target_properties(Orthanc::Plugins 
                        PROPERTIES
                        INTERFACE_INCLUDE_DIRECTORIES "${ORTHANC_PLUGINS_INCLUDE_DIR}")

  message(STATUS "Found Orthanc SDK: ${ORTHANC_PLUGINS_INCLUDE_DIR}")
else()
  message(WARNING "Could not find Orthanc. Use ORTHANC_ROOT to indicate where to find the Orthanc SDK")
endif()