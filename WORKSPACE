## WORKSPACE
load("@bazel_tools//tools/jdk:remote_java_repository.bzl", "remote_java_repository")

# Setup Amazon Corretto 21 for macOS ARM64
remote_java_repository(
    name = "corretto_21_macos",
    prefix = "correttojdk",
    sha256 = "0c4e08fc4b7c0c887651a97f315d6995eeac38627eb7bca0cb3c698d21af349f",
    strip_prefix = "amazon-corretto-21.jdk/Contents/Home",
    target_compatible_with = ["@platforms//os:macos"],
    urls = ["https://corretto.aws/downloads/latest/amazon-corretto-21-aarch64-macos-jdk.tar.gz"],
    version = "21",
)

register_toolchains("//:corretto21_jdk_toolchain")  # Register the Amazon Corretto 21 toolchain
