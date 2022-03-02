include_guard(GLOBAL)

include("${CMAKE_CURRENT_LIST_DIR}/utilities/polly_init.cmake")

polly_init(
    "wasienv / c++17 support"
    "Ninja"
)

include("${CMAKE_CURRENT_LIST_DIR}/utilities/polly_common.cmake")

include("${CMAKE_CURRENT_LIST_DIR}/compiler/wasienv.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/flags/cxx17.cmake")
