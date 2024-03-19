local mappings = {
  normal = {
    ['<leader>x'] = { '<CMD> bd <CR>', 'Close current buffer' },
    ['<Esc>'] = { '<CMD> noh <CR>', 'Remove highlighted searches' },

    ['<C-h>'] = { '<C-w>h', 'Move to the left window' },
    ['<C-j>'] = { '<C-w>j', 'Move to the bottom window' },
    ['<C-k>'] = { '<C-w>k', 'Move to the top window' },
    ['<C-l>'] = { '<C-w>l', 'Move to the right window' },
  },

  insert = {
    ['<C-h>'] = { '<Left>', 'Move left' },
    ['<C-j>'] = { '<Down>', 'Move down' },
    ['<C-k>'] = { '<Up>', 'Move up' },
    ['<C-l>'] = { '<Right>', 'Move right' },
  },

  lsp = {
    ['<leader>l'] = {
      name = '+lsp',
      a = { '<CMD> lua vim.lsp.buf.code_action() <CR>', 'Code action' },
      d = { '<CMD> lua vim.lsp.buf.definition() <CR>', 'Definition' },
      i = { '<CMD> lua vim.lsp.buf.implementation() <CR>', 'Implementation' },
      r = { '<CMD> lua vim.lsp.buf.rename() <CR>', 'Rename' },
      s = { '<CMD> lua vim.lsp.buf.signature_help() <CR>', 'Signature help' },
      t = { '<CMD> lua vim.lsp.buf.type_definition() <CR>', 'Type definition' },
    },
  },
}

return function() return mappings end
