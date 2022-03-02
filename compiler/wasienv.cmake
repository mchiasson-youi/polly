include_guard(GLOBAL)

include(polly_fatal_error)

if(XCODE_VERSION)
  set(_err "This toolchain is not available for Xcode")
  set(_err "${_err} because Xcode ignores CMAKE_C(XX)_COMPILER variable.")
  set(_err "${_err} Use xcode.cmake toolchain instead.")
  polly_fatal_error(${_err})
endif()

find_program(CMAKE_C_COMPILER wasicc)
find_program(CMAKE_CXX_COMPILER wasic++)

set(WASIENV 1)

if(NOT CMAKE_C_COMPILER)
  polly_fatal_error("wasicc not found")
endif()

if(NOT CMAKE_CXX_COMPILER)
  polly_fatal_error("wasic++ not found")
endif()

set(
    CMAKE_C_COMPILER
    "${CMAKE_C_COMPILER}"
    CACHE
    STRING
    "C compiler"
    FORCE
)

set(
    CMAKE_CXX_COMPILER
    "${CMAKE_CXX_COMPILER}"
    CACHE
    STRING
    "C++ compiler"
    FORCE
)
