return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'hrsh7th/nvim-cmp' },
  config = require('config.plugins.lspconfig').setup,
}
