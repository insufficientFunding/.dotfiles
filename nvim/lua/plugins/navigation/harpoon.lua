return {
  'ThePrimeagen/harpoon',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {},
  config = function(_, opts)
    require('harpoon').setup(opts)

    -- Keybindings
    local map = require('config.mappings').harpoon
    require('which-key').add(map, {
      mode = 'n',
      buffer = nil,
    })
  end,
}
