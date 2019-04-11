// Copyright 2019 @polkadot/wasm-dalek-ed25519 authors & contributors
// This software may be modified and distributed under the terms
// of the Apache-2.0 license. See the LICENSE file for details.
// @ts-check

const { beforeAll, runAll } = require('./all');

(async () => {
  await beforeAll();
  runAll();
})();
