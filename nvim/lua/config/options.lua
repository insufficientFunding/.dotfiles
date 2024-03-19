local opt = vim.opt

opt.clipboard = 'unnamedplus'

opt.mouse = ''

opt.hidden = true

opt.number = true
opt.relativenumber = true
opt.numberwidth = 3
opt.ruler = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smarttab = true
opt.shiftround = true

opt.smartindent = true
opt.breakindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand('$HOME/.nvim/undodir')
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.backspace = 'indent,eol,start'

opt.list = true
opt.listchars:append('tab:▷\\')
opt.listchars:append('eol: ') --󰌑')
opt.listchars:append('trail:·')
opt.listchars:append('lead:·')
opt.listchars:append('space:·')
opt.listchars:append('nbsp:')

opt.lazyredraw = false

opt.completeopt = 'menuone,noselect'
opt.pumheight = 20

opt.splitkeep = 'cursor'

---@diagnostic disable-next-line: undefined-field
vim.opt.fillchars:append({
  horiz = '─',
  horizup = '┴',
  horizdown = '┬',
  vert = '│',
  vertleft = '┤',
  vertright = '├',
  verthoriz = '┼',
  eob = ' ',
})

opt.termguicolors = true

opt.scrolloff = 3
opt.sidescrolloff = 3

opt.signcolumn = 'yes'
opt.isfname:append('@-@')

if vim.fn.has('nvim-0.10') == 1 then opt.smoothscroll = true end

opt.updatetime = 50

opt.colorcolumn = '80'
