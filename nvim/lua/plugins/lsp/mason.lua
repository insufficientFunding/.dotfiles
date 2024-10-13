return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
  },

  config = function()
    local mason = require('mason')
    local mason_lspconfig = require('mason-lspconfig')
    mason.setup()

    vim.notify('Installing LSP servers...', vim.log.levels.INFO)

    mason_lspconfig.setup({
      ensure_installed = { 'lua_ls' },

      automatic_installation = true,
    })
  end,
}
