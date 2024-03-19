return {

  'akinsho/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim',
  },
  keys = {
    {
      '<leader>Fc',
      '<CMD> Telescope flutter commands <CR>',
      desc = 'Open flutter commands',
    },
  },
  config = function()
    require('flutter-tools').setup({
      widget_guides = { enabled = true },

      lsp = {
        on_attach = function(client, bufnr)
          require('config.plugins.lspconfig').on_attach(client, bufnr)
          vim.cmd('highlight FlutterWidgetGuides guifg=#505050')
        end,
      },
    })

    require('telescope').load_extension('flutter')
  end,
}
