# Description: Tensorflow Serving test utils.

package(default_visibility = [
    "//tensorflow_serving:internal",
])

licenses(["notice"])  # Apache 2.0

filegroup(
    name = "all_files",
    srcs = glob(
        ["**/*"],
        exclude = [
            "**/METADATA",
            "**/OWNERS",
        ],
    ),
)

cc_library(
    name = "test_util",
    testonly = 1,
    srcs = ["test_util.cc"],
    hdrs = ["test_util.h"],
    deps = [
        "@com_google_googletest//:gtest",
        "@org_tensorflow//tensorflow-xsmm/core",
        "@org_tensorflow//tensorflow-xsmm/core:lib",
        "@org_tensorflow//tensorflow-xsmm/core:test",
        "@protobuf_archive//:protobuf",
    ],
)
