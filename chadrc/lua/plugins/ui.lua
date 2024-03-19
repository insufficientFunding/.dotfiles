return {

  {
    'luukvbaal/statuscol.nvim',
    lazy = false,
    opts = function()
      local builtin = require('statuscol.builtin')

      return {
        ft_ignore = { 'NvimTree' },
        segments = {
          { text = { ' ' } },
          { sign = { text = { '.*' } } },
          { text = { ' ' } },
          { text = { builtin.lnumfunc, ' ' } },
        },
      }
    end,
  },

  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      cmdline = {
        view = 'cmdline',
      },
      lsp = {
        hover = { enabled = false },
        signature = { enabled = false },
        documentation = { enabled = false },
      },
    },
    config = function(_, opts)
      require('noice').setup(opts)
      require('telescope').load_extension('noice')
    end,
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
      'nvim-telescope/telescope.nvim',
    },
  },
}
