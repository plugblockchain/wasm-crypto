#!/usr/bin/env bash

set -e

# shortcuts for files
echo "*** Adjusting output"
SRC=build/wasm.js

# We don't want inline requires
sed -i -e 's/var wasm;/const crypto = require('\''crypto'\''); let wasm; const requires = { crypto };/g' $SRC
sed -i -e 's/return addHeapObject(require(varg0));/return addHeapObject(requires[varg0]);/g' $SRC

# this creates issues in both the browser and RN (@plugnet/util has a polyfill)
sed -i -e 's/const TextEncoder = require('\''util'\'')\.TextEncoder;/const { stringToU8a } = require('\''@plugnet\/util'\'');/g' $SRC
sed -i -e 's/let cachedTextEncoder = new /\/\/ let cachedTextEncoder = new /g' $SRC
sed -i -e 's/cachedTextEncoder\.encode/stringToU8a/g' $SRC

# this creates issues in both the browser and RN (@plugnet/util has a polyfill)
sed -i -e 's/const TextDecoder = require('\''util'\'')\.TextDecoder;/const { u8aToString } = require('\''@plugnet\/util'\'');/g' $SRC
sed -i -e 's/let cachedTextDecoder = new /\/\/ let cachedTextDecoder = new /g' $SRC
sed -i -e 's/cachedTextDecoder\.decode/u8aToString/g' $SRC

# replace to use asmjs
sed -i -e 's/const createPromise =.*$/const createPromise = ()=>Promise.resolve(require('\''.\/wasm_bg'\''));/g' $SRC
rm -rf build/*-e
