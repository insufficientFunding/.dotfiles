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
        ignore_focus = {
          'NvimTree',
          'neo-tree',
          'neo-tree-popup',
          'dapui_watches',
          'dapui_breakpoints',
          'dapui_scopes',
          'dapui_console',
          'dapui_stacks',
          'dap-repl',
        },
      },
      sections = {
        lualine_c = { require('ui.statusline.recording_widget') },
        lualine_y = { require('ui.statusline.session_widget') },
      },
    }
  end,
}
