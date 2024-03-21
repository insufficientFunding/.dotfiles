---@diagnostic disable: duplicate-set-field
return {
  'insufficientFunding/lspsaga.nvim',
  event = 'LspAttach',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
    'folke/which-key.nvim',
    'neovim/nvim-lspconfig',
  },
  opts = {
    ui = {
      collapse = '',
      expand = '',
      actionfix = '󰌵',
      code_action = '󰌵',
      imp_sign = '󰋺',
    },
    lightbulb = {
      virtual_text = false,
    },
    hover = {
      max_width = 0.4,
    },
    diagnostic = {
      max_width = 0.4,
    },
    outline = {
      win_width = 40,
    },
  },
  config = function(_, opts)
    require('lspsaga').setup(opts)

    require('config.plugins.lspsaga').config()
  end,
  keys = {
    {
      '<C-t>',
      '<CMD> Lspsaga term_toggle <CR>',
      desc = 'Toggle terminal',
      mode = { 'n', 't' },
    },
  },
}
