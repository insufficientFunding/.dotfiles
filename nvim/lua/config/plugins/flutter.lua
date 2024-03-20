local M = {}

function M.on_attach(client, bufnr)
  require('config.plugins.lspconfig').on_attach(client, bufnr)
  vim.cmd('highlight FlutterWidgetGuides guifg=#505050')
end

function M.setup()
  require('flutter-tools').setup({
    widget_guides = { enabled = true },

    lsp = {
      on_attach = M.on_attach,
    },
  })

  require('telescope').load_extension('flutter')
end
return M
