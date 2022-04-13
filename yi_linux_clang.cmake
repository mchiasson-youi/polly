include(${CMAKE_CURRENT_LIST_DIR}/ninja-clang-cxx17-fpic.cmake)
set(YI_PLATFORM Linux CACHE STRING "")
set(YI_PLATFORM_LOWER linux CACHE STRING "")
set(YI_PLATFORM_UPPER LINUX CACHE STRING "")

# core/cmake/Platform/YiCoreLinux.cmake contents
add_definitions(-DYI_LINUX=1)

# cmake/Platform/YiLinux.cmake contents
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
        if(CMAKE_CONFIGURATION_TYPES)
            # Multi-configuration generators (VS, Xcode) append a per-configuration
            # sub-directory to this value already, so we can use just the binary directory.
            set(_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}")
            if(CMAKE_BUILD_TYPE)
                # When using a multi-configuration generator CMAKE_BUILD_TYPE will not be used.
                # This uses the CMAKE_BUILD_TYPE preventing cmake from warning about the unused variable.
            endif()
        else()
            set(_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/bin")
        endif()

        set(YI_BASE_OUTPUT_DIRECTORY "${_RUNTIME_OUTPUT_DIRECTORY}")
        # Set the output directory for the executable to be consistent with the YI_BASE_OUTPUT_DIRECTORY
        set_target_properties(${_ARGS_PROJECT_TARGET}
            PROPERTIES
                RUNTIME_OUTPUT_DIRECTORY ${_RUNTIME_OUTPUT_DIRECTORY}
        )
    endif()

    target_compile_definitions(${_ARGS_PROJECT_TARGET}
        PUBLIC
            YI_LINUX
            YI_LOGGING
    )

    target_compile_options(${_ARGS_PROJECT_TARGET}
        PUBLIC $<$<CONFIG:Debug>:-g3>
        PUBLIC $<$<CONFIG:Release>:-g -O3>
    )

    target_link_libraries(${_ARGS_PROJECT_TARGET}
        # The -rdynamic option is needed for embdedding symbol names,
        # to give more user-friendly stack traces.
        # (see https://man7.org/linux/man-pages/man3/backtrace.3.html#NOTES)
        PUBLIC $<$<CONFIG:Debug>:-rdynamic>
    )
endmacro(yi_configure_platform)
