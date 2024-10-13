return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    triggers = {
      { '<auto>', mode = 'nixsotc' },
      { 's', mode = 'n' },
      -- { '<leader>', mode = { 'n', 'v' } },
    },
  },
  keys = {
    {
      '<LEADER>?',
      function()
        require('which-key').show({ global = false })
      end,
      desc = 'Buffer local mappings (which-key)',
    },
  },
  config = function(_, opts)
    local wk = require('which-key')
    local mappings = require('config.mappings')

    opts.spec = {
      mappings.normal,
      mappings.insert,
      mappings.terminal,
    }

    wk.setup(opts)
    -- wk.add(mappings.multiple_modes)
    --
  end,
  debug = false,
}
