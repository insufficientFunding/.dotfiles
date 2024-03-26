return {
  dir = '~/workspace/flutter-tools.nvim',
  -- 'akinsho/flutter-tools.nvim',
  event = { 'BufReadPre *.dart' },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim',
  },
  keys = {
    {
      '<leader>fc',
      '<CMD> Telescope flutter commands <CR>',
      desc = 'Open flutter commands',
    },
  },
  config = require('config.plugins.flutter').setup,
}
