require('nvchad.options')
local opt = vim.opt

opt.list = true
opt.listchars:append('tab:▷\\')
opt.listchars:append('eol: ') --󰌑')
opt.listchars:append('trail:·')
opt.listchars:append('lead:·')
opt.listchars:append('space:·')
opt.listchars:append('nbsp:')

opt.relativenumber = true
opt.cursorlineopt = 'both'
opt.signcolumn = 'yes'

opt.colorcolumn = '80'

opt.wrap = false
