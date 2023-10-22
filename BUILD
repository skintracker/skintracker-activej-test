load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_binary", "kt_jvm_test")
load(
    "@bazel_tools//tools/jdk:default_java_toolchain.bzl",
    "BASE_JDK9_JVM_OPTS",
    "DEFAULT_JAVACOPTS",
    "DEFAULT_TOOLCHAIN_CONFIGURATION",
    "default_java_toolchain",
)

default_java_toolchain(
    name = "corretto21_toolchain",
    configuration = DEFAULT_TOOLCHAIN_CONFIGURATION,
    java_runtime = "@corretto_21_macos//:jdk",
    javacopts = DEFAULT_JAVACOPTS + ["--enable-preview"],
    jvm_opts = BASE_JDK9_JVM_OPTS + ["--enable-preview"],
    source_version = "21",
    target_version = "21",
)

toolchain(
    name = "corretto21_jdk_toolchain",
    target_compatible_with = ["@platforms//os:macos"],
    toolchain = ":corretto21_toolchain",
    toolchain_type = "@bazel_tools//tools/jdk:toolchain_type",
)

# Define a Kotlin binary target for your web server
kt_jvm_binary(
    name = "Skintracker",
    srcs = glob(["src/main/kotlin/**/*.kt"]),  # Point this to your source files
    main_class = "src.main.java.io.skintracker.Main",  # Replace with your main class
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
        "@maven//:org_jetbrains_kotlin_kotlin_test",
        "@maven//:org_jetbrains_kotlin_kotlin_test_junit",
        "@maven//:org_junit_jupiter_junit_jupiter",
        "@maven//:org_junit_jupiter_junit_jupiter_api",
        "@maven//:org_junit_jupiter_junit_jupiter_engine",
        "@maven//:org_junit_platform_junit_platform_console",
    ],
)
