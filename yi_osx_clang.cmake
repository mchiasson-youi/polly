include(${CMAKE_CURRENT_LIST_DIR}/ninja-clang-cxx17-fpic.cmake)
set(YI_PLATFORM Osx CACHE STRING "")
set(YI_PLATFORM_LOWER osx CACHE STRING "")
set(YI_PLATFORM_UPPER OSX CACHE STRING "")

# core/cmake/Platform/YiCoreOsx.cmake contents
add_definitions(-DYI_OSX=1)

# cmake/Platform/YiOsx.cmake contents
if(__yi_platform_included)
    return()
endif()
set(__yi_platform_included 1)

macro(yi_configure_platform)
    cmake_parse_arguments(_ARGS "" "PROJECT_TARGET" "" ${ARGN})

    if(NOT _ARGS_PROJECT_TARGET)
        message(FATAL_ERROR "'yi_configure_platform' requires the PROJECT_TARGET argument be set")
    endif()

    get_target_property(_TARGET_TYPE ${_ARGS_PROJECT_TARGET} TYPE)
    if(_TARGET_TYPE STREQUAL EXECUTABLE)
        if(XCODE)
            set(YI_BASE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/$(CONFIGURATION)")
            set(_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}")
        else()
            set(YI_BASE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/bin")
            set(_RUNTIME_OUTPUT_DIRECTORY "${YI_BASE_OUTPUT_DIRECTORY}")
        endif()

        # Set the output directory for the executable to be consistent with the YI_BASE_OUTPUT_DIRECTORY
        set_target_properties(${_ARGS_PROJECT_TARGET}
            PROPERTIES
                RUNTIME_OUTPUT_DIRECTORY ${_RUNTIME_OUTPUT_DIRECTORY}
        )
    endif()

    set_target_properties(${_ARGS_PROJECT_TARGET}
        PROPERTIES
            XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_ARC "YES"
            XCODE_ATTRIBUTE_DEAD_CODE_STRIPPING[variant=Release] "YES"
    )

endmacro(yi_configure_platform)