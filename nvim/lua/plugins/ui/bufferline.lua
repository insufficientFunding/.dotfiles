return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    {
      '<Tab>',
      '<CMD> BufferLineCycleNext <CR>',
      desc = 'Move to next buffer',
    },
    {
      '<S-Tab>',
      '<CMD> BufferLineCyclePrev <CR>',
      desc = 'Move to previous buffer',
    },
  },
  init = function()
    require('bufferline').setup({
      options = {
        separator_style = 'slant',
        --themable = false,
        diagnostics = 'nvim_lsp',
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'File Explorer',
            separator = false,
          },
        },
        show_close_icon = false,
        show_buffer_close_icons = false,
        diagnostics_indicator = function(count, level, _, _)
          local icon = level:match('error') and ' ' or ' '
          return ' ' .. icon .. count
        end,
      },
    })
  end,
}
