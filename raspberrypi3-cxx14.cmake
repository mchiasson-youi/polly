# Copyright (c) 2015, 2017 Alexandre Pretyman
# All rights reserved.

if(DEFINED POLLY_RASPBERRYPI3_CXX14_CMAKE)
  return()
else()
  set(POLLY_RASPBERRYPI3_CXX14_CMAKE 1)
endif()

include("${CMAKE_CURRENT_LIST_DIR}/utilities/polly_init.cmake")

polly_init(
    "RaspberryPi 3 Cross Compile / C++14"
    "Ninja"
)

include("${CMAKE_CURRENT_LIST_DIR}/utilities/polly_common.cmake")

include(polly_clear_environment_variables)

include("${CMAKE_CURRENT_LIST_DIR}/flags/cxx14.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/compiler/gcc-cross-compile-raspberry-pi.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/os/raspberry-pi3.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/os/raspberry-pi-hardfloat.cmake")
