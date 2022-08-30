# © You.i TV Inc. All rights reserved.
###########################################################################
# WebOS 5.x platform specific compiler and linker configuration parameters.
###########################################################################

set(_WEBOS_VERSION webos5)
set(WEBOS_NDK_ENV_VAR "WEBOS5_NDK_HOME")

# Need to find the NDK5 HOME location
find_path(WEBOS_NDK_HOME NAMES "version-ca9v1-starfishmllib32-linux-gnueabi"
    PATHS
        ${WEBOS_NDK_HOME}
        ENV ${WEBOS_NDK_ENV_VAR}
        /opt/starfish-sdk-x86_64/5.0.0-20190510
    NO_CMAKE_FIND_ROOT_PATH
)

if(NOT IS_DIRECTORY ${WEBOS_NDK_HOME})
    message(FATAL_ERROR "Could not locate the WebOS 5.0 NDK folder.\nPlease set the ${WEBOS_NDK_ENV_VAR} environment variable to the installation folder of your WebOS 5.0 NDK, or install the WebOS 5.0 NDK to the default '/opt/starfish-sdk-x86_64' path.")
endif()

set(STARFISH_HOME ${WEBOS_NDK_HOME})
set(STARFISH_GCC_REQUIRED_ARCH "gnueabi")
set(STARFISH_MISSING_GCC_ERROR "Could not find arm-starfish-linux gcc in ${WEBOS_NDK_ENV_VAR}.\n Check that the WebOS5 NDK has been installed correctly.")

set(WEBOS5 1)
set(WEBOS_VERSION_NAME "version-ca9v1-starfishmllib32-linux-gnueabi")
set(WEBOS_DISTRO "5.0.0")
set(WEBOS_SYSROOT ${WEBOS_NDK_HOME}/sysroots/ca9v1-starfishmllib32-linux-gnueabi)
set(WEBOS_ROOT ${WEBOS_NDK_HOME}/platforms/webOSTV5.0/arch-arm/)

include(${CMAKE_CURRENT_LIST_DIR}/os/webos-common.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/compiler/starfish-gcc.cmake)