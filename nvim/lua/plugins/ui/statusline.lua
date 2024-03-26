return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'echasnovski/mini.sessions',
  },
  opts = function()
    return {
      options = {
        theme = require('base46.integrations.lualine')(),
        icons_enabled = true,
        component_separators = '|',
        section_separators = { left = '', right = '' },
        ignore_focus = { 'NvimTree' },
      },
      sections = {
        lualine_c = { require('ui.statusline.recording_widget') },
        lualine_y = { require('ui.statusline.session_widget') },
      },
    }
  end,
}
