include_guard(GLOBAL)

include(polly_fatal_error)

if(XCODE_VERSION)
  set(_err "This toolchain is not available for Xcode")
  set(_err "${_err} because Xcode ignores CMAKE_C(XX)_COMPILER variable.")
  set(_err "${_err} Use xcode.cmake toolchain instead.")
  polly_fatal_error(${_err})
endif()

set(WASI-SDK 1)

set(CMAKE_C_COMPILER   $ENV{WASI_SDK_DIR}/bin/clang   CACHE STRING "C Compiler"   FORCE)
set(CMAKE_CXX_COMPILER $ENV{WASI_SDK_DIR}/bin/clang++ CACHE STRING "C++ Compiler" FORCE)
set(CMAKE_LINKER       $ENV{WASI_SDK_DIR}/bin/wasm-ld CACHE STRING "Linker"       FORCE)

set(CMAKE_SYSROOT $ENV{WASI_SDK_DIR}/share/wasi-sysroot)
