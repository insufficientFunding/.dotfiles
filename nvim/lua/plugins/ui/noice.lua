return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    lsp = {
      override = {
        ['vim.lsp.utils.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.utils.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true,
      },
    },
    cmdline = {
      view = 'cmdline',
    },
    popupmenu = {
      backend = 'cmp',
    },
    presets = {
      long_message_to_split = true,
      inc_rename = true,
      command_palette = true,
    },
    views = {
      cmdline = {
        position = {
          row = '99%',
          col = 0,
        },
      },
    },
  },
  config = function(_, opts)
    require('noice').setup(opts)

    require('telescope').load_extension('noice')
  end,
}
