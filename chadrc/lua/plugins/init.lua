return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    config = function()
      require('configs.conform')
    end,
  },

  {
    'nvim-tree/nvim-tree.lua',
    opts = {
      renderer = {
        indent_width = 1,
        highlight_git = 'none',
        icons = {
          glyphs = {
            git = {
              unstaged = '',
              staged = '',
              unmerged = '',
              renamed = '󰑕',
              untracked = '󱄶',
              deleted = '',
              ignored = '',
            },
          },
        },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = false,
      },
      git = {
        show_on_open_dirs = false,
      },

    },
  },

  {
    'lewis6991/gitsigns.nvim',
    enabled = false,
  },

  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
    event = 'VeryLazy',
    opts = {},
  },

  {
    'echasnovski/mini.nvim',
    version = false,
    lazy = true,
    dependencies = {
      'NvChad/base46',
    },
    config = function()
      require('configs.mini')
    end,
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    build = 'make',
    init = function()
      require('telescope').load_extension('fzf')
    end,
  },
}
