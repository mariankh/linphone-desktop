#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "linphone" for configuration "Release"
set_property(TARGET linphone APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(linphone PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/liblinphone.so.9"
  IMPORTED_SONAME_RELEASE "liblinphone.so.9"
  )

list(APPEND _IMPORT_CHECK_TARGETS linphone )
list(APPEND _IMPORT_CHECK_FILES_FOR_linphone "${_IMPORT_PREFIX}/lib/liblinphone.so.9" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)