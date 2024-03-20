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
        auto_enable = true,
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
        '<ESC> <CMD> lua require("Comment.api").toggle.linewise(vim.fn.visualmode()) <CR>',
        desc = 'Toggle comment',
        mode = { 'n', 'v' },
      },
    },
  },
}
