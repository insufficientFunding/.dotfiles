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

  vim.api.nvim_create_user_command('LuaLSPluginDev', function()
    M.setup_lua({
      enabled = true,
      plugins = true,
      runtime = true,
      types = true,
    })
  end, {
    desc = 'Setup Lua language server with plugins',
  })

  local servers = { 'lua_ls', 'tsserver' }

  for _, server in ipairs(servers) do
    lspconfig[server].setup({
      on_attach = M.on_attach,
      capabilities = M.capabilities(),
    })
  end

  M.setup_lua({
    enabled = true,
    plugins = false,
    runtime = true,
    types = false,
  })
end

---@class LuaLSOptions
---@field enabled boolean
---@field plugins boolean|string
---@field runtime boolean|table<string>
---@field types boolean

--- Gets the Lua library for the Lua language server.
--- This is used to provide the Lua language server with the neovim runtime.
--- @param opts LuaLSOptions
--- @return table
local function get_lua_library(opts)
  local returned = {}

  local function add(lib, filter)
    ---@diagnostic disable-next-line: param-type-mismatch
    for _, p in ipairs(vim.fn.expand(lib .. '/lua', false, true)) do
      local plugin_name = vim.fn.fnamemodify(p, ':h:t')
      ---@diagnostic disable-next-line: undefined-field
      p = vim.loop.fs_realpath(p)
      if p and (not filter or filter[plugin_name]) then
        table.insert(returned, p)
      end
    end
  end

  if opts.runtime then
    add(type(opts.runtime) == 'string' and opts.runtime or '$VIMRUNTIME')
  end

  if opts.plugins then
    ---@type table<string, boolean>
    local filter
    if type(opts.plugins) == 'table' then
      filter = {}
      ---@diagnostic disable-next-line: param-type-mismatch
      for _, plugin in pairs(opts.plugins) do
        filter[plugin] = true
      end
    end
    for _, site in pairs(vim.split(vim.o.packpath, ',')) do
      add(site .. '/pack/*/opt/*', filter)
      add(site .. '/pack/*/start/*', filter)
    end
    if package.loaded['lazy'] then
      for _, plugin in ipairs(require('lazy').plugins()) do
        add(plugin.dir, filter)
      end
    end
  end

  return returned
end

--- Sets up the Lua language server.
--- @param opts LuaLSOptions
function M.setup_lua(opts)
  local lspconfig = require('lspconfig')

  local library = get_lua_library(opts)

  lspconfig['lua_ls'].setup({
    on_attach = M.on_attach,
    capabilities = M.capabilities(),
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          library = library,
        },
      },
    },
  })
end

return M
