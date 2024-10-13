return {
  {
    'github/copilot.vim',
    event = 'VeryLazy',
    init = function()
      vim.g.copilot_no_tab_map = true
    end,
    keys = {
      {
        '<M-l>',
        'copilot#Accept("\\<CR>")',
        expr = true,
        replace_keycodes = false,
        mode = 'i',
      },
    },
  },

  {
    enabled = false,
    dir = '~/workspace/cosco.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    event = 'InsertEnter',
    opts = {},
    keys = {
      {
        '<C-;>',
        '<cmd>lua require("cosco.line_endings").add_line_ending()<CR>',
        desc = 'Add line ending',
        mode = 'i',
      },
    },
  },

  {
    'uga-rosa/ccc.nvim',
    lazy = true,
    keys = {
      {
        '<leader>cp',
        '<cmd>CccPick<CR>',
        desc = 'Open color picker',
      },
    },
    opts = {
      highlighter = {
        auto_enable = false,
      },
    },
  },

  {
    'numToStr/Comment.nvim',
    opts = {
      mappings = false,
    },
    keys = {
      {
        '<leader>/',
        '<CMD> lua require("Comment.api").toggle.linewise.current() <CR>',
        desc = 'Toggle comment',
      },
      {
        '<leader>/',
        '<ESC> <CMD> lua require("Comment.api").toggle.linewise(vim.fn.visualmode()) <CR>',
        desc = 'Toggle comment',
        mode = { 'v' },
      },
    },
  },
}
