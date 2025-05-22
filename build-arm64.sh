#!/bin/bash

# Build ARM64 Linux binaries using Docker (similar to CI)
set -e

echo "Building for aarch64-unknown-linux-gnu using Docker..."

docker run --rm \
  -v "$(pwd)":/build \
  -w /build \
  ghcr.io/napi-rs/napi-rs/nodejs-rust:lts-debian-aarch64 \
  bash -c "set -e && \
    rustup target add aarch64-unknown-linux-gnu && \
    yarn build --target aarch64-unknown-linux-gnu && \
    aarch64-linux-gnu-strip *.node"

echo "ARM64 build completed successfully!"
echo "Binary location: $(ls -la *.linux-arm64-gnu.node 2>/dev/null || echo 'No ARM64 binary found')"