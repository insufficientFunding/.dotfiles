return {
  {
    'j-morano/buffer_manager.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      {
        '<leader>b',
        '<CMD> lua require("buffer_manager.ui").toggle_quick_menu() <CR>',
        desc = 'Toggle buffer manager',
      },
    },
  },
}
