return {
  'insufficientFunding/bufferline.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-neo-tree/neo-tree.nvim',
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
    _G.__cached_neo_tree_selector = nil
    _G.__get_selector = function()
      return _G.__cached_neo_tree_selector
    end

    require('bufferline').setup({
      options = {
        -- separator_style = 'slant',
        themable = true,
        diagnostics = 'nvim_lsp',
        offsets = {
          {
            filetype = 'neo-tree',
            -- raw = '%{%v:lua._G.__get_selector()%} ',
            -- highlight = { sep = { link = 'WinSeparator' } },
            separator = ' ',
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
