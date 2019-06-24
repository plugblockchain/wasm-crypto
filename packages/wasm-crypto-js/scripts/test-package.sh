#!/usr/bin/env bash

set -e

echo "*** Testing WASM"
node ./test/wasm.js

echo "*** Testing via Jest"
NODE_OPTIONS=--max_old_space_size=8192 yarn jest ./test/jest.spec.js
