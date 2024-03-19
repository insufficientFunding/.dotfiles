local statusline = require('ui.statusline')

local M = {}

local BOLD_ITALIC = { bold = true, italic = true }

M.ui = {
  theme = 'rose-pine-neo',
  transparent = true,
  cmp = {
    style = 'atom_colored',
  },
  tabufline = {
    order = { 'treeOffset', 'buffers', 'tabs' },
  },
  nvdash = {
    load_on_startup = true,
  },
  statusline = {
    order = statusline.order,
    modules = {
      session = statusline.active_session,
      recording = statusline.recording_macro,
    },
  },
  hl_add = {
    St_session_sep = { fg = '#e0be7b' },
    St_session_icon = { bg = '#e0be7b', fg = 'one_bg3' },
    St_session_text = { bg = 'lightbg', fg = 'white' },
    St_session_end = { fg = 'lightbg' },

    St_recording_sep = { bg = 'black2', fg = 'red' },
    St_recording_text = { bg = 'red', fg = 'black2', bold = true },

    DiagnosticSignWarn = { fg = '#e7c787' },
    DiagnosticSignError = { fg = '#e06c75' },
    DiagnosticSignInfo = { fg = '#98c379' },
    DiagnosticSignHint = { fg = '#c882e7' },

    DiagnosticUnderlineWarn = { sp = '#e7c787', undercurl = true },
    DiagnosticUnderlineError = { sp = '#e06c75', undercurl = true },
    DiagnosticUnderlineInfo = { sp = '#98c379', undercurl = true },
    DiagnosticUnderlineHint = { sp = '#c882e7', undercurl = true },

    ['@boolean'] = { fg = '#FACF85', italic = true },
    NvimTreeExecFile = { undercurl = false },
  },

  hl_override = {
    DiagnosticHint = BOLD_ITALIC,
    DiagnosticError = BOLD_ITALIC,
    DiagnosticWarn = BOLD_ITALIC,
    DiagnosticInformation = BOLD_ITALIC,

    ['@keyword'] = BOLD_ITALIC,
    ['@keyword.function'] = BOLD_ITALIC,
    ['@keyword.return'] = BOLD_ITALIC,
    ['@keyword.operator'] = BOLD_ITALIC,
    ['@keyword.import'] = BOLD_ITALIC,
    ['@keyword.conditional'] = BOLD_ITALIC,
    ['@keyword.conditional.ternary'] = BOLD_ITALIC,
    ['@keyword.repeat'] = BOLD_ITALIC,
    ['@keyword.directive'] = BOLD_ITALIC,
    ['@keyword.directive.define'] = BOLD_ITALIC,

    St_Lsp = { fg = '#353b45', italic = true },

    Error = { bold = true, italic = true, undercurl = true },
    UnderLined = { underline = false },
    NonText = { fg = 'one_bg2' },

  },

  changed_themes = {
    ['rose-pine-neo'] = {
      base_16 = {
        base00 = '#1e222a',
        base01 = '#353b45',
        base02 = '#3e4451',
        base03 = '#545862',
        base04 = '#565c64',
        --base0A = '#FACF80',
        base0B = '#98c379',
      },
      base_30 = {
        pmenu_bg = '#FACF80',
      },
    },
  },
}

vim.api.nvim_set_hl(0, 'NvimTreeExecFile', { link = 'NONE' })

return M
