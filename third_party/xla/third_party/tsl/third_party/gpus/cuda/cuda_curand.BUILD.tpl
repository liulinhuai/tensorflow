licenses(["restricted"])  # NVIDIA proprietary license

filegroup(
    name = "include",
    srcs = glob([
        "include/**",
    ]),
)

cc_import(
    name = "curand",
    hdrs = [":headers"],
    shared_library = "lib/libcurand.so.%{version}",
    visibility = ["//visibility:public"],
)

filegroup(
    name="curand_lib",
    srcs = ["lib/libcurand.so.%{version}"]
)

cc_library(
    name = "headers",
    hdrs = [":include"],
    include_prefix = "third_party/gpus/cuda/include",
    includes = ["include"],
    strip_include_prefix = "include",
    visibility = ["@local_config_cuda//cuda:__pkg__"],
)
