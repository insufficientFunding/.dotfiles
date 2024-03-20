return {
  'echasnovski/mini.nvim',
  version = false,
  lazy = true,
  config = require('config.plugins.mini').setup,
  keys = {
    {
      '<C-s>',
      '<CMD> lua require("mini.sessions").select() <CR>',
      desc = 'Pick session',
    },
    {
      '<LEADER>sn',
      '<CMD> lua require("config.plugins.mini").write() <CR>',
      desc = 'Write new session',
    },
  },
}
