return {
  'nvim-tree/nvim-tree.lua',
  enabled = false,
  opts = {
    filters = {
      custom = { '.g.dart' },
    },
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = false,
    sync_root_with_cwd = true,
    renderer = {
      indent_width = 1,
      indent_markers = { enable = true },

      highlight_git = true,
      highlight_opened_files = 'none',

      icons = {
        git_placement = 'after',
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
      enable = true,
      show_on_open_dirs = false,
      ignore = true,
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
