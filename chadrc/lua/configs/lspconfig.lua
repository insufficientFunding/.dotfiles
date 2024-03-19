local configs = require('nvchad.configs.lspconfig')

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require('lspconfig')
local servers = { 'tsserver', 'lua_ls' }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_init = on_init,
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

lspconfig['lua_ls'].setup({
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

vim.diagnostic.config({
  update_in_insert = true,
  signs = true,
  underline = true,
  severity_sort = true,
})
