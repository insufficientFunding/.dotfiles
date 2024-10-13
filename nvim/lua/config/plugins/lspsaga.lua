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
  -- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

  opts.desc = 'Go to previous diagnostic'
  vim.keymap.set('n', '[d', command('diagnostic_jump_prev'), opts)
  -- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)

  opts.desc = 'Show hover documenation'
  -- vim.keymap.set('n', 'K', command('hover_doc'), opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

  whichkey.add({
    buffer = bufnr,
    mode = 'n',
    {
      { '<LEADER>l', group = '+lsp' },
      {
        '<LEADER>ld',
        command('show_line_diagnostics'),
        desc = 'Show line diagnostics',
      },
      {
        '<LEADER>lb',
        command('show_buf_diagnostics'),
        desc = 'Show buffer diagnostics',
      },
      {
        '<LEADER>lw',
        '<CMD> Telescope diagnostics <CR>',
        desc = 'Show workspace diagnostics',
      },
      { '<LEADER>lr', ':IncRename ', desc = 'Rename' },
      { '<LEADER>lf', '<CMD> Lspsaga finder <CR>', desc = 'Open finder' },
      {
        '<LEADER>lo',
        command('outline'),
        desc = 'Open symbol outline',
      },
    },
    {
      { '<LEADER>g', group = '+goto' },
      { '<LEADER>gd', vim.lsp.buf.definition, desc = 'Go to definition' },
    },
    {
      mode = { 'n', 'v' },
      { '<LEADER>c', group = '+code' },
      {
        '<LEADER>ca',
        vim.lsp.buf.code_action,
        desc = 'Code action',
      },
    },
    {
      '<LEADER>D',
      command('show_workspace_diagnostics'),
      desc = 'Open workspace diagnostics',
    },
  })
end

return M
