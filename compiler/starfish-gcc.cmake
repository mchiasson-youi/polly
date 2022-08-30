# © You i Labs Inc. All rights reserved.
# This module accepts 1 optional variable :
#   - STARFISH_GCC_REQUIRED_ARCH : To specify the architecture required for the compiler
include_guard()

set(STARFISH_TOOL_BASENAME "arm-starfish-linux-${STARFISH_GCC_REQUIRED_ARCH}")

if(NOT STARFISH_GCC_REQUIRED_ARCH)
    set(STARFISH_TOOL_BASENAME "arm-starfish-linux")
endif()

set(TOOLCHAIN_PREFIX ${STARFISH_HOME}/sysroots/x86_64-starfishsdk-linux/usr/bin/arm-starfish-linux-${STARFISH_GCC_REQUIRED_ARCH}/${STARFISH_TOOL_BASENAME})
if(NOT EXISTS ${TOOLCHAIN_PREFIX}-gcc)
    if (STARFISH_MISSING_GCC_ERROR)
        message(FATAL_ERROR ${STARFISH_MISSING_GCC_ERROR})
    else()
        message(FATAL_ERROR "Could not locate the ${STARFISH_TOOL_BASENAME}-gcc compiler within the STARFISH_HOME variable path '${STARFISH_HOME}'.")
    endif()
endif()

include_directories(SYSTEM ${STARFISH_HOME}/sysroots/x86_64-starfishsdk-linux/usr/include)

SET(CMAKE_C_COMPILER_ID "GNU")
SET(CMAKE_CXX_COMPILER_ID "GNU")
SET(CMAKE_C_COMPILER    ${TOOLCHAIN_PREFIX}-gcc)
SET(CMAKE_CXX_COMPILER  ${TOOLCHAIN_PREFIX}-g++)
SET(CMAKE_AR            ${TOOLCHAIN_PREFIX}-ar CACHE FILEPATH "Archiver")
SET(CMAKE_LINKER        ${TOOLCHAIN_PREFIX}-ld CACHE FILEPATH "Linker")
SET(CMAKE_NM            ${TOOLCHAIN_PREFIX}-nm CACHE FILEPATH "ListSymbol")
SET(CMAKE_OBJCOPY       ${TOOLCHAIN_PREFIX}-objcopy CACHE FILEPATH "ObjectCopy")
SET(CMAKE_OBJDUMP       ${TOOLCHAIN_PREFIX}-objdump CACHE FILEPATH "ObjectDump")
SET(CMAKE_RANLIB        ${TOOLCHAIN_PREFIX}-ranlib CACHE FILEPATH "LibIndexGenerator")
SET(CMAKE_STRIP         ${TOOLCHAIN_PREFIX}-strip CACHE FILEPATH "LibStripper")
