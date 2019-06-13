#!/usr/bin/env bash

set -e

[[ ! -d ../wasm-crypto/build ]] && echo 'build wasm-crypto first' && exit 1

# cleanup old
echo "*** Cleaning old builds"
rm -rf ./build ./pkg

echo "*** Copying build from wasm-crypto"
mkdir build || true
cp -r ../wasm-crypto/build/wasm_opt.wasm ../wasm-crypto/build/wasm.js ../wasm-crypto/build/*.d.ts ./build/

# shortcuts for files
echo "*** Adjusting output"
BGJ=build/wasm_bg.js
SRC=build/wasm.js
DEF=build/wasm.d.ts
WSM=build/wasm_bg.wasm
OPT=build/wasm_opt.wasm
ASM=build/wasm_asm.js

# build asmjs version from the input (optimised) WASM
echo "*** Building asm.js version"
../../binaryen/bin/wasm2js --no-validation --output $ASM $OPT
NODE_OPTIONS=--max_old_space_size=8192 yarn babel $ASM --presets @babel/preset-env --out-file=$BGJ
rm -f $ASM

# copy our package interfaces
echo "*** Copying package sources"
cp ../wasm-crypto/src/js/* build/
rm -rf build/*.wasm build/package.json
cp package.json README.md build/
