# Copyright (c) 2017-2019, Ruslan Baratov
# Copyright (c) 2020, Clemens Arth
# All rights reserved.

if(DEFINED POLLY_IOS_14_3_DEP_10_0_DEVICE_CMAKE_)
  return()
else()
  set(POLLY_IOS_14_3_DEP_10_0_DEVICE_CMAKE_ 1)
endif()

include("${CMAKE_CURRENT_LIST_DIR}/utilities/polly_clear_environment_variables.cmake")

include("${CMAKE_CURRENT_LIST_DIR}/utilities/polly_init.cmake")

set(IOS_SDK_VERSION 14.3)
set(IOS_DEPLOYMENT_SDK_VERSION 10.0)

set(POLLY_XCODE_COMPILER "clang")
polly_init(
    "iOS ${IOS_SDK_VERSION} / Deployment ${IOS_DEPLOYMENT_SDK_VERSION} / Universal (arm64 armv7s armv7) / \
${POLLY_XCODE_COMPILER} / \
c++14 support"
    "Xcode"
)

include("${CMAKE_CURRENT_LIST_DIR}/utilities/polly_common.cmake")

include(polly_fatal_error)

# Fix try_compile
include(polly_ios_bundle_identifier)

set(CMAKE_MACOSX_BUNDLE YES)
set(CMAKE_XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "iPhone Developer")

set(IPHONEOS_ARCHS armv7;armv7s;arm64)
set(IPHONESIMULATOR_ARCHS "")

include("${CMAKE_CURRENT_LIST_DIR}/compiler/xcode.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/os/iphone.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/flags/cxx14.cmake")

include("${CMAKE_CURRENT_LIST_DIR}/utilities/polly_ios_development_team.cmake")