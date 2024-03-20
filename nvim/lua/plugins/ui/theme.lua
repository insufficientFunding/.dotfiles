return {
  'insufficientFunding/base46.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'akinsho/bufferline.nvim',
  },
  config = function()
    require('base46').setup({
      theme = 'rosepine',
      integrations = {
        'lsp',
        'bufferline',
        'treesitter',
        'whichkey',
        'telescope',
        'syntax',
        'mason',
        'defaults',
        'cmp',
        'devicons',
        'rainbowdelimiters',
        'lspsaga',
      },
    })
  end,
}
