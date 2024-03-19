return {
  --'insufficientFunding/base46.nvim',
  dir = '~/workspace/base46',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'akinsho/bufferline.nvim',
  },
  config = function()
    require('base46').setup({
      theme = 'rosepine',
    })
  end,
}
