#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "matroska2-static" for configuration "Release"
set_property(TARGET matroska2-static APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(matroska2-static PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libmatroska2.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS matroska2-static )
list(APPEND _IMPORT_CHECK_FILES_FOR_matroska2-static "${_IMPORT_PREFIX}/lib/libmatroska2.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
