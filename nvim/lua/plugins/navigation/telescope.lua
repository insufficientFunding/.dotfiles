return {
  'nvim-telescope/telescope.nvim',

  lazy = false,

  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-ui-select.nvim',
  },

  keys = {
    { '<leader>ff', '<Cmd> Telescope find_files <CR>', desc = 'Find files' },
    { '<leader>fg', '<Cmd> Telescope live_grep <CR>', desc = 'Live grep' },
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
    })

    telescope.load_extension('fzf')
    telescope.load_extension('ui-select')
  end,
}
