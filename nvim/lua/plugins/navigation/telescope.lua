return {
  'nvim-telescope/telescope.nvim',

  lazy = false,

  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-telescope/telescope-frecency.nvim',
  },

  keys = {
    {
      '<leader>ff',
      '<CMD> Telescope frecency workspace=CWD <CR>',
      desc = 'Find files',
    },
    { '<leader>fb', '<CMD> Telescope buffers <CR>', desc = 'Show buffers' },
    { '<leader>fg', '<CMD> Telescope live_grep <CR>', desc = 'Live grep' },
  },

  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ['<Tab>'] = actions.move_selection_next,
            ['<S-Tab>'] = actions.move_selection_previous,
          },
        },
      },
      pickers = {
        colorscheme = {
          enable_preview = true,
        },
      },
      extensions = {
        frecency = {
          matcher = 'fuzzy',
        },
      },
    })

    telescope.load_extension('fzf')
    telescope.load_extension('ui-select')
    telescope.load_extension('frecency')
  end,
}
