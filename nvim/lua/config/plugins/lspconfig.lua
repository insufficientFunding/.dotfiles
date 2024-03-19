local M = {}

function M.on_attach(_, bufnr)
  local which_key = require('which-key')

  which_key.register(require('config.mappings')().lsp, {
    mode = 'n',
    buffer = bufnr,
  })
end

function M.capabilities()
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }

  return capabilities
end

function M.setup()
  local lspconfig = require('lspconfig')

  vim.diagnostic.config({
    underline = true,
    signs = true,
    update_in_insert = true,
    virtual_text = {
      prefix = '',
    },
    severity_sort = true,
  })

  local servers = { 'lua_ls', 'tsserver' }

  for _, server in ipairs(servers) do
    lspconfig[server].setup({
      on_attach = M.on_attach,
      capabilities = M.capabilities(),
    })
  end

  lspconfig['lua_ls'].setup({
    on_attach = M.on_attach,
    capabilities = M.capabilities(),
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.expand('config') .. '/lua'] = true,
          },
        },
      },
    },
  })
end

return M
