# skintracker-activej-test

This is a test repository for using Kotlin + ActiveJ + Bazel as a replacement for Bun + Aponia. It is not intended to be used for anything other than testing. To gain the latest Java 21 features, a custom toolchain has been defined to use Amazon Corretto 21.

## Dependencies

1. [Bazel](https://bazel.build/)
2. [ActiveJ](https://activej.io/)
3. [Kotlin](https://kotlinlang.org/)
4. [Amazon Corretto 21 JDK](https://docs.aws.amazon.com/corretto/latest/corretto-21-ug/downloads-list.html)

## Supported Platforms

* MacOS aarch64

All other platforms are unsupported.

## Building

To build the project, run:

```bash
make
```

## Running

To run the project, run:

```bash
make start
```

This should start the ActiveJ server on port 8080. You can then access the server at http://localhost:8080.
