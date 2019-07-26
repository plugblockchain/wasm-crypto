#!/usr/bin/env bash

set -e

./scripts/install-build-deps.sh

lerna run build --stream --scope=@plugnet/wasm-crypto

lerna run test --stream --scope=@plugnet/wasm-crypto

#echo "*** Building packages"
#cd packages
#
#PACKAGES=( $(ls -1d *) )
#
#for PKG in "${PACKAGES[@]}"; do
#  if [ -f "$PKG/package.json" ]; then
#    echo "*** Building $PKG"
#    cd $PKG
#
#    ../../scripts/build-package.sh
#    ../../scripts/test-package.sh
#
#    rm -rf build/*-e build/package.json build/README.md
#    ls -al build
#
#    cd ..
#  fi
#done
#
#cd ..
