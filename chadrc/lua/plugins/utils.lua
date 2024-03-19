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
        auto_enable = false,
      }
    },
  },
}
