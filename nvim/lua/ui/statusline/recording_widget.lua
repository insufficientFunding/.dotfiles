local M = require('lualine.component'):extend()
local highlight = require('lualine.highlight')

function M:init(options)
  M.super.init(self, options)

  self.highlights = {
    fg = highlight.create_component_highlight_group(
      { fg = '#dc5858' },
      'recording_fg',
      self.options
    ),
  }
end

function M:update_status()
  local recording = vim.fn.reg_recording()

  if recording == nil or string.len(recording) == 0 then return '' end

  local text = ' RECORDING @'
  local fg_hl = highlight.component_format_highlight(self.highlights.fg)

  return fg_hl .. text .. recording
end

return M
