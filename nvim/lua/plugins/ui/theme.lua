return {
  'olimorris/onedarkpro.nvim',
  priority = 1000,
  opts = {
    styles = {
      comments = 'italic',
      keywords = 'italic',
      functions = 'italic',
      operators = 'italic',
      conditionals = 'italic',
    },
    highlights = {
      Whitespace = { fg = '#272c35' },
      Comment = { fg = '#32373d', extend = true },
      CursorLine = { bg = 'NONE' },
      CmpItemAbbrMatch = { underline = true, extend = true },
      CmpSel = { bg = '#32373d' },
      ['@keyword.operator.lua'] = { link = 'Keyword' },
      ['@parameter'] = { fg = '${fg}' },
    },
    options = {
      cursorline = false,
      transparency = true,
      lualine_transparency = true,
    },
  },
  config = function(_, opts)
    require('onedarkpro').setup(opts)

    vim.cmd('colorscheme onedark_dark')
  end,
}
-- return {
--   -- 'insufficientFunding/base46.nvim',
--   dir = '~/workspace/base46',
--   -- 'insufficientFunding/base46.nvim',
--   dependencies = {
--     'nvim-lua/plenary.nvim',
--     'akinsho/bufferline.nvim',
--   },
--   config = function()
--     require('base46').setup({
--       theme = 'rosepine',
--       integrations = {
--         'neotree',
--         'dap',
--         'lsp',
--         'bufferline',
--         'treesitter',
--         'whichkey',
--         'telescope',
--         'syntax',
--         'mason',
--         'defaults',
--         'cmp',
--         'devicons',
--         'rainbowdelimiters',
--         'lspsaga',
--       },
--       vim.cmd([[
-- set guicursor=i-ci:ver25-iCursor-blinkwait175-blinkon175-blinkoff17
--       \,n-v-c:block-iCursor-blinkwait175-blinkon175-blinkoff175
--       ]]),
--     })
--   end,
-- }
