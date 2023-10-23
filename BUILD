load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library", "kt_jvm_test")
load("@rules_graalvm//graalvm:defs.bzl", "native_image")

kt_jvm_library(
    name = "Skintracker",
    srcs = glob(["src/main/kotlin/**/*.kt"]),  # Point this to your source files
    # main_class = "src.main.java.io.skintracker.Main",  # Replace with your main class
    deps = [
        "@maven//:io_activej_activej_common",
        "@maven//:io_activej_activej_http",
        "@maven//:io_activej_activej_inject",
        "@maven//:io_activej_activej_launcher",
        "@maven//:io_activej_activej_launchers_http",
        "@maven//:io_activej_activej_promise",
    ],
)

kt_jvm_test(
    name = "SkintrackerTests",
    srcs = glob(["src/test/kotlin/**/*.kt"]),
    args = [
        "--select-package=io.skintracker",
    ],
    main_class = "org.junit.platform.console.ConsoleLauncher",
    deps = [
        "@maven//:io_activej_activej_common",
        "@maven//:io_activej_activej_http",
        "@maven//:io_activej_activej_inject",
        "@maven//:io_activej_activej_launcher",
        "@maven//:io_activej_activej_launchers_http",
        "@maven//:io_activej_activej_promise",
        "@maven//:org_apache_logging_log4j_log4j_api",
        "@maven//:org_apache_logging_log4j_log4j_core",
        "@maven//:org_apache_logging_log4j_log4j_slf4j_impl",
        "@maven//:org_jetbrains_kotlin_kotlin_test",
        "@maven//:org_jetbrains_kotlin_kotlin_test_junit",
        "@maven//:org_junit_jupiter_junit_jupiter",
        "@maven//:org_junit_jupiter_junit_jupiter_api",
        "@maven//:org_junit_jupiter_junit_jupiter_engine",
        "@maven//:org_junit_platform_junit_platform_console",
    ],
)

native_image(
    name = "SkintrackerNative",
    deps = [":Skintracker"],
    main_class = "Main",
    native_image_tool = "@graalvm//:native-image",
)