return {

  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      --'nvim-treesitter/nvim-treesitter-context',
    },
    build = ':TSUpdate',
    event = 'VeryLazy',

    init = function(plugin)
      require('lazy.core.loader').add_to_rtp(plugin)

      require('nvim-treesitter.query_predicates')
    end,

    config = function()
      local configs = require('nvim-treesitter.configs')

      configs.setup({
        ensure_installed = {
          'lua',
          'vimdoc',
          'vim',
          'markdown',
          'markdown_inline',
          'hyprlang',
          'bash',
          'jsonc',
          'dart',
        },
        sync_install = false,
        highlight = { enable = true },
        indent = {
          enable = true,
          disable = { 'yuck' },
        },
      })

      vim.filetype.add({
        extension = { rasi = 'rasi', yuck = 'yuck', arb = 'json' },
        pattern = {
          ['.*/waybar/config'] = 'jsonc',
          ['.*/kitty/*.conf'] = 'bash',
          ['.*/hypr/.*%.conf'] = 'hyprlang',
        },
      })
    end,
  },
}
