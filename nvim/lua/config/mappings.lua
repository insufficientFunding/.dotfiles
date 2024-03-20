local mappings = {
  normal = {
    ['<leader>x'] = { '<CMD> bd <CR>', 'Close current buffer' },
    ['<leader>X'] = { '<CMD> bd! <CR>', 'Force close current buffer' },

    ['<Esc>'] = { '<CMD> noh <CR>', 'Remove highlighted searches' },

    ['<C-h>'] = { '<C-w>h', 'Move to the left window' },
    ['<C-j>'] = { '<C-w>j', 'Move to the bottom window' },
    ['<C-k>'] = { '<C-w>k', 'Move to the top window' },
    ['<C-l>'] = { '<C-w>l', 'Move to the right window' },

    --['ZZ'] = { '<CMD> quitall <CR>', 'Save and quit' },
  },

  insert = {
    ['<C-h>'] = { '<Left>', 'Move left' },
    ['<C-j>'] = { '<Down>', 'Move down' },
    ['<C-k>'] = { '<Up>', 'Move up' },
    ['<C-l>'] = { '<Right>', 'Move right' },
  },

  terminal = {
    ['<C-x>'] = { '<C-\\><C-N>', 'Exit terminal mode' },
  },

  multiple_modes = {
    {
      modes = { 'n', 't' },
      keys = {},
    },
  },

  lsp = {},
}

return function()
  return mappings
end
