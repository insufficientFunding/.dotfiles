return {
  'nvim-tree/nvim-tree.lua',
  opts = {
    disable_netrw = true,
    renderer = {
      indent_width = 1,
      highlight_git = 'none',
      icons = {
        glyphs = {
          git = {
            unstaged = '',
            staged = '',
            unmerged = '',
            renamed = '󰑕',
            untracked = '󱄶',
            deleted = '',
            ignored = '',
          },
        },
      },
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      show_on_open_dirs = false,
    },
    git = {
      show_on_open_dirs = false,
    },

  },
  keys = {
    {
      '<leader>e',
      '<Cmd> NvimTreeFocus <CR>',
      desc = 'Focus file explorer',
    },
  },
}
