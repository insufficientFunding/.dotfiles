require('nvchad.mappings')

-- add yours here

local map = vim.keymap.set

map('n', ';', ':', { desc = 'CMD enter command mode' })

map('n', '<leader>fm', function()
  require('conform').format({ async = true, lsp_fallback = true })
end, { desc = 'File Format with conform' })

map('i', 'jk', '<ESC>', { desc = 'Escape insert mode' })

map({ 'n', 't' }, '<C-M-v>', function()
  require('nvchad.term').toggle({ pos = 'vsp', id = 'vtoggleTerm', size = 0.3 })
end, { desc = 'Terminal Toggleable vertical term' })

map({ 'n', 't' }, '<C-M-h>', function()
  require('nvchad.term').toggle({ pos = 'sp', id = 'htoggleTerm', size = 0.3 })
end, { desc = 'Terminal New horizontal term' })

map('n', '<C-s>', function()
  require('mini.sessions').select()
end, {
  desc = 'Open session picker',
})
