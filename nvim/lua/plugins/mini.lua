return {
  'echasnovski/mini.nvim',
  version = false,
  lazy = true,
  config = require('config.plugins.mini'),
  keys = {
    {
      '<C-s>',
      '<Cmd>lua require("mini.sessions").select()<CR>',
      desc = 'Pick session',
    },
  },
}
