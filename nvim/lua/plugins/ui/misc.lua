return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      indent = {
        char = '│',
        highlight = { 'Whitespace' },
      },
      whitespace = {
        highlight = { 'Whitespace' },
        remove_blankline_trail = false,
      },
      scope = {
        show_start = false,
        show_end = false,
      },
    },
  },

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
}
