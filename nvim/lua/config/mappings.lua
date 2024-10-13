return {
  normal = {
    mode = 'n',
    { '<leader>x', '<CMD> bd <CR>', desc = 'Close current buffer' },
    { '<leader>X', '<CMD> bd! <CR>', desc = 'Force close current buffer' },

    { '<Esc>', '<CMD> noh <CR>', desc = 'Remove highlighted searches' },

    { '<C-h>', '<C-w>h', desc = 'Move to the left window' },
    { '<C-j>', '<C-w>j', desc = 'Move to the bottom window' },
    { '<C-k>', '<C-w>k', desc = 'Move to the top window' },
    { '<C-l>', '<C-w>l', desc = 'Move to the right window' },

    {
      '<leader>N',
      "<CMD> lua require('notify').dismiss() <CR>",
      desc = 'Dismiss notifications',
    },

    --['ZZ'] = { '<CMD> quitall <CR>', 'Save and quit' },
  },

  insert = {
    mode = 'i',
    { '<C-h>', '<Left>', desc = 'Move left' },
    { '<C-j>', '<Down>', desc = 'Move down' },
    { '<C-k>', '<Up>', desc = 'Move up' },
    { '<C-l>', '<Right>', desc = 'Move right' },
  },

  terminal = {
    mode = 't',
    { '<C-x>', '<C-\\><C-N>', desc = 'Exit terminal mode' },
  },

  multiple_modes = {
    {
      modes = { 'n', 'i', 'v' },
      keys = {},
    },
  },

  lsp = {},

  harpoon = {
    { '<leader>h', group = 'Harpoon' },
    {
      '<leader>hA',
      function()
        require('harpoon.mark').add_file()
      end,
      desc = 'Add file',
    },
    {
      '<leader>ha',
      function()
        require('harpoon.ui').toggle_quick_menu()
      end,
      desc = 'Toggle quick menu',
    },
    {
      '<leader>hs',
      function()
        require('harpoon.term').sendCommand(1, 'ls')
      end,
      desc = 'Send ls to terminal 1',
    },
    {
      '<leader>hS',
      function()
        require('harpoon.term').sendCommand(1, 'pwd')
      end,
      desc = 'Send pwd to terminal 1',
    },
    {
      '<leader>ht',
      function()
        require('harpoon.term').gotoTerminal(1)
      end,
      desc = 'Go to terminal 1',
    },
    {
      '<leader>hT',
      function()
        require('harpoon.term').sendCommand(1, 'echo hello')
      end,
      desc = 'Send echo hello to terminal 1',
    },
  },
}
