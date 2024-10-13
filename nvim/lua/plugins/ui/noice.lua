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
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true,
      },
      signature = {
        enabled = true,
      },
    },
    cmdline = {
      view = 'cmdline',
    },
    popupmenu = {
      backend = 'cmp',
    },
    presets = {
      inc_rename = true,
      command_palette = true,
      lsp_doc_border = true,
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
    require('notify').setup({
      background_colour = '#000000',
    })

    require('noice').setup(opts)

    require('telescope').load_extension('noice')
  end,
}
