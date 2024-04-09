return {
  -- 'insufficientFunding/base46.nvim',
  dir = '~/workspace/base46',
  -- 'insufficientFunding/base46.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'insufficientFunding/bufferline.nvim',
  },
  config = function()
    require('base46').setup({
      theme = 'rosepine',
      integrations = {
        'neotree',
        'dap',
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
