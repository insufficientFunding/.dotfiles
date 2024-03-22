return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  dependencies = { 'hrsh7th/nvim-cmp' },
  opts = {},
  config = function(_, opts)
    require('nvim-autopairs').setup(opts)

    local cmp_autopairs = require('nvim-autopairs.completion.cmp')

    ---@type cmp.Core
    ---@diagnostic disable-next-line: assign-type-mismatch
    local cmp = require('cmp')

    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  end,
}
