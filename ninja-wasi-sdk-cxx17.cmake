include_guard(GLOBAL)

include("${CMAKE_CURRENT_LIST_DIR}/utilities/polly_init.cmake")

polly_init(
    "wasi-sdk / C++17 Support"
    "Ninja"
)

include("${CMAKE_CURRENT_LIST_DIR}/utilities/polly_common.cmake")

include("${CMAKE_CURRENT_LIST_DIR}/compiler/wasi-sdk.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/flags/cxx17.cmake")
