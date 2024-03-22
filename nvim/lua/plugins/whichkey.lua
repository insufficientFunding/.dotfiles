return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    triggers = { '<LEADER>', '"', "'", '`', 'c', 'v', 'g', 's' },
  },
  config = function(_, opts)
    vim.o.timeout = true
    vim.o.timeoutlen = 300

    local wk = require('which-key')
    local mappings = require('config.mappings')()

    wk.setup(opts)

    wk.register(mappings.normal, { mode = 'n' })
    wk.register(mappings.insert, { mode = 'i' })
    wk.register(mappings.terminal, { mode = 't' })

    -- for _, mode in ipairs(mappings.multiple_modes) do
    --   wk.register(mode.keys, { mode = mode.modes })
    -- end
  end,
}
