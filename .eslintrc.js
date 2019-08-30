const base = require('@plugnet/dev/config/eslint');

module.exports = {
  ...base,
  parserOptions: {
    ...base.parserOptions,
    extraFileExtensions: ['*.d.ts'],
    project: [
      './tsconfig.eslint.json'
    ]
  }
};
