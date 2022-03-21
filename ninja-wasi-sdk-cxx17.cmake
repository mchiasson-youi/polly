include_guard(GLOBAL)

include("${CMAKE_CURRENT_LIST_DIR}/utilities/polly_init.cmake")

polly_init(
    "wasi-sdk / C++17 Support"
    "Ninja"
)

include("${CMAKE_CURRENT_LIST_DIR}/utilities/polly_common.cmake")

include("${CMAKE_CURRENT_LIST_DIR}/compiler/wasi-sdk.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/flags/cxx14.cmake")

set(CMAKE_HAVE_LIBC_PTHREAD TRUE CACHE BOOL "pthread stub")
set(CMAKE_THREAD_LIBS_INIT "pthread" CACHE STRING "pthread stub")
set(CMAKE_USE_PTHREADS_INIT TRUE CACHE BOOL "pthread stub")

# Required for 3rdparty libs who are using `#include <sys/mman.h>` or `#include <signals.h>` like ICU, etc
add_definitions(-D_WASI_EMULATED_MMAN -D_WASI_EMULATED_SIGNAL)
set(CMAKE_C_IMPLICIT_LINK_LIBRARIES wasi-emulated-mman wasi-emulated-signal pthread)
set(CMAKE_CXX_IMPLICIT_LINK_LIBRARIES wasi-emulated-mman wasi-emulated-signal pthread)

