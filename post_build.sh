#!/bin/bash

# Check if the target directory exists and exit if it does
if [ -d "bazel-bin/external/corretto_21_macos" ]; then
    echo "Post-build: Directory bazel-bin/external/corretto_21_macos already exists. Exiting."
    exit 0
fi

# Detecting the system's platform
PLATFORM="$(uname -s)"

# Detecting the architecture
ARCHITECTURE="$(uname -m)"

# Construct the Corretto 21 URL based on the system's platform and architecture
case "$PLATFORM" in
  "Darwin")
    PLATFORM="macos"
    case "$ARCHITECTURE" in
      "x86_64")
        ARCHITECTURE="x64"
        ;;
      "arm64")
        ARCHITECTURE="aarch64"
        ;;
      *)
        echo "Unsupported architecture: $ARCHITECTURE"
        exit 1
        ;;
    esac
    ;;
  "Linux")
    PLATFORM="linux"
    # Assuming you might need Linux architecture in the future
    case "$ARCHITECTURE" in
      "x86_64")
        ARCHITECTURE="x64"
        ;;
      "arm64" | "aarch64")
        ARCHITECTURE="aarch64"
        ;;
      *)
        echo "Unsupported architecture: $ARCHITECTURE"
        exit 1
        ;;
    esac
    ;;
  *)
    echo "Unsupported platform: $PLATFORM"
    exit 1
    ;;
esac

URL="https://corretto.aws/downloads/latest/amazon-corretto-21-$ARCHITECTURE-$PLATFORM-jdk.tar.gz"

# Download using curl
curl -LO $URL

# Extract the tarball
tar -xzf amazon-corretto-21-$ARCHITECTURE-$PLATFORM-jdk.tar.gz

# Move the extracted contents to the specified location
mv amazon-corretto-21.jdk/Contents/Home bazel-bin/external/corretto_21_macos

# Clean up the tarball and extracted directory
rm amazon-corretto-21-$ARCHITECTURE-$PLATFORM-jdk.tar.gz
rm -r amazon-corretto-21.jdk

echo "Post-build: Done."
