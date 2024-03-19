return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    triggers = { 's', 'c', 'z', '<leader>', 'g' },
  },
  config = function(_, opts)
    local wk = require('which-key')
    local mappings = require('config.mappings')()

    wk.setup(opts)

    wk.register(mappings.normal, { mode = 'n' })
    wk.register(mappings.insert, { mode = 'i' })
  end,
}
