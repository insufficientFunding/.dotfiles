local M = {}
local commands

function M.config()
  local lspconfig = require('config.plugins.lspconfig')
  lspconfig.on_attach = M.on_attach

  lspconfig.setup()
end

local function command(name, args)
  return function()
    commands.load_command(name, args)
  end
end

function M.on_attach(_, bufnr)
  commands = require('lspsaga.command')

  ---- Override built in LSP functions ----
  local whichkey = require('which-key')

  local opts = { noremap = true, silent = true, buffer = bufnr }

  opts.desc = 'Go to next diagnostic'
  vim.keymap.set('n', ']d', command('diagnostic_jump_next'), opts)

  opts.desc = 'Go to previous diagnostic'
  vim.keymap.set('n', '[d', command('diagnostic_jump_prev'), opts)

  opts.desc = 'Show hover documenation'
  vim.keymap.set('n', 'K', command('hover_doc'), opts)

  whichkey.register({
    ['<LEADER>'] = {
      D = {
        command('show_workspace_diagnostics'),
        'Open workspace diagnostics',
      },
      l = {
        name = '+lsp',
        d = { command('show_line_diagnostics'), 'Show line diagnostics' },
        D = { command('show_buf_diagnostics'), 'Show buffer diagnostics' },
        r = { command('rename'), 'Rename' },
        f = { '<CMD> Lspsaga finder <CR>', 'Open finder' },
        o = { command('outline'), 'Open symbol outline' },
      },
      g = {
        name = '+goto',
        d = { command('goto_definition'), 'Go to definition' },
      },
      c = {
        name = '+code',
        a = { vim.lsp.buf.code_action, 'Code action' },
      },
    },
  }, {
    mode = 'n',
    buffer = bufnr,
  })
end

return M
