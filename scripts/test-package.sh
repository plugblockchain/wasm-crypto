#!/usr/bin/env bash

set -e

echo "*** Testing package"

echo "*** Testing Rust"
RUST_BACKTRACE=full rustup run nightly-2019-09-01 cargo test --release -- --nocapture

echo "*** Testing WASM"
node ./test/wasm.js

echo "*** Testing ASM.js"
node ./test/asm.js

echo "*** Testing via Jest"
yarn jest ./test/jest.spec.js
