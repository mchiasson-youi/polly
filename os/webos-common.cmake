# =============================================================================
# © You.i TV Inc. All rights reserved.
include_guard()

set(YI_PLATFORM ${_WEBOS_VERSION} CACHE STRING "")

string(TOLOWER "${_WEBOS_VERSION}" YI_PLATFORM_LOWER)
set(YI_PLATFORM_LOWER "${YI_PLATFORM_LOWER}" CACHE STRING "")

string(TOUPPER "${_WEBOS_VERSION}" YI_PLATFORM_UPPER)
set(YI_PLATFORM_UPPER "${YI_PLATFORM_UPPER}" CACHE STRING "")

set(WEBOS 1)

set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR arm)
set(CMAKE_SYSTEM_VERSION 1)

set(CMAKE_POSITION_INDEPENDENT_CODE true)

set(CMAKE_C_FLAGS_INIT              "")
set(CMAKE_CXX_FLAGS_INIT            "")
set(CMAKE_C_FLAGS_RELEASE_INIT      "-g0 -fdata-sections -ffunction-sections -Wl,--gc-sections")
set(CMAKE_CXX_FLAGS_RELEASE_INIT    "-g0 -fdata-sections -ffunction-sections -Wl,--gc-sections")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

file(READ ${WEBOS_NDK_HOME}/${WEBOS_VERSION_NAME} WEBOS_NDK_VERSION_CONTENTS)
if(NOT ${WEBOS_NDK_VERSION_CONTENTS} MATCHES "(Distro Version: ${WEBOS_DISTRO})")
    message(FATAL_ERROR "Could not determine the version of ${WEBOS_NDK_ENV_VAR}.\nPlease check the '${WEBOS_VERSION_NAME}' file to ensure the 'Distro Version:' is set to '${WEBOS_DISTRO}'.")
endif()

message(STATUS "${WEBOS_NDK_ENV_VAR}: ${WEBOS_NDK_HOME}")

set(_LDFLAGS "-lNDL -lNDL_log -lNDL_media -lSDL2")

if(NOT(WEBOS5 OR WEBOS6))
    string(APPEND _LDFLAGS " -static-libgcc -static-libstdc++")
endif()

# Note: -Wno-psabi is needed to avoid unnecessary warnings from modern GCC
# Note: -Wl,--allow-shlib-undefined is needed for linking the elementary stream player library on webOS 4 & 6
string(APPEND CMAKE_CXX_FLAGS " -Wno-psabi -Wl,--allow-shlib-undefined")

set(CMAKE_SHARED_LINKER_FLAGS_INIT  "${_LDFLAGS}")
set(CMAKE_MODULE_LINKER_FLAGS_INIT  "${_LDFLAGS}")
set(CMAKE_EXE_LINKER_FLAGS_INIT     "${_LDFLAGS}")

set(CMAKE_SYSROOT           ${WEBOS_SYSROOT} CACHE PATH "")
set(CMAKE_FIND_ROOT_PATH    ${WEBOS_ROOT} CACHE PATH "")
set(CMAKE_PREFIX_PATH       ${WEBOS_ROOT} CACHE PATH "")

string(APPEND CMAKE_EXE_LINKER_FLAGS_INIT       " -L${WEBOS_SYSROOT}/usr/lib -L${WEBOS_ROOT}/usr/lib ")
string(APPEND CMAKE_SHARED_LINKER_FLAGS_INIT    " -L${WEBOS_SYSROOT}/usr/lib -L${WEBOS_ROOT}/usr/lib ")
string(APPEND CMAKE_MODULE_LINKER_FLAGS_INIT    " -L${WEBOS_SYSROOT}/usr/lib -L${WEBOS_ROOT}/usr/lib ")