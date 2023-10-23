## WORKSPACE
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
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

RULES_JVM_EXTERNAL_TAG = "4.5"

RULES_JVM_EXTERNAL_SHA = "b17d7388feb9bfa7f2fa09031b32707df529f26c91ab9e5d909eb1676badd9a6"

http_archive(
    name = "rules_jvm_external",
    sha256 = RULES_JVM_EXTERNAL_SHA,
    strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_TAG,
)

load("@rules_jvm_external//:repositories.bzl", "rules_jvm_external_deps")

rules_jvm_external_deps()

load("@rules_jvm_external//:setup.bzl", "rules_jvm_external_setup")

rules_jvm_external_setup()

# Setup ActiveJ Maven dependencies
load("@rules_jvm_external//:defs.bzl", "maven_install")

maven_install(
    artifacts = [
        "org.jetbrains.kotlin:kotlin-test:1.9.10",
        "org.jetbrains.kotlin:kotlin-test-junit:1.9.10",
        "io.activej:activej-common:5.5",
        "io.activej:activej-http:5.5",  # Ensure versions match your requirements
        "io.activej:activej-inject:5.5",
        "io.activej:activej-launcher:5.5",
        "io.activej:activej-launchers-http:5.5",
        "io.activej:activej-promise:5.5",
        "io.jstach:jstachio:1.3.3",
        "org.junit.jupiter:junit-jupiter:5.10.0",
        "org.junit.jupiter:junit-jupiter-api:5.10.0",
        "org.junit.jupiter:junit-jupiter-engine:5.10.0",
        "org.junit.platform:junit-platform-console:1.10.0",
        "org.apache.logging.log4j:log4j-api:2.21.0",
        "org.apache.logging.log4j:log4j-core:2.21.0",
        "org.apache.logging.log4j:log4j-slf4j-impl:2.21.0",
    ],
    repositories = [
        "https://maven.google.com",
        "https://repo1.maven.org/maven2",
    ],
)

# Setup Kotlin rules for Bazel
rules_kotlin_version = "1.8"

rules_kotlin_sha = "01293740a16e474669aba5b5a1fe3d368de5832442f164e4fbfc566815a8bc3a"

http_archive(
    name = "rules_kotlin",
    sha256 = rules_kotlin_sha,
    urls = ["https://github.com/bazelbuild/rules_kotlin/releases/download/v%s/rules_kotlin_release.tgz" % rules_kotlin_version],
)

load("@rules_kotlin//kotlin:repositories.bzl", "kotlin_repositories")

kotlin_repositories()  # Set up default Kotlin repositories

load("@rules_kotlin//kotlin:core.bzl", "kt_register_toolchains")

kt_register_toolchains()  # Register the default Kotlin toolchains

register_toolchains("//:corretto21_jdk_toolchain")  # Register the Amazon Corretto 21 toolchain
