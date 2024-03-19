return {
  'akinsho/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim',
  },
  opts = {
    lsp = {
      on_attach = function(client, bufnr)
        local config = require('nvchad.configs.lspconfig')
        config.on_attach(client, bufnr)
      end,
    },
  },
  config = true,
}
