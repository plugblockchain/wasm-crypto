const config = require('@plugnet/dev/config/jest');

module.exports = Object.assign({}, config, {
  moduleNameMapper: {
    '@plugnet/wasm-(schnorrkel)(.*)$': '<rootDir>/packages/wasm-$1/src/$2',
  },
  modulePathIgnorePatterns: [
    '<rootDir>/packages/wasm-schnorrkel/build'
  ]
});
