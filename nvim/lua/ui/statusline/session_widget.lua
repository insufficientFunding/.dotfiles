local M = require('lualine.component'):extend()
local highlight = require('lualine.highlight')

function M:init(options)
  M.super.init(self, options)

  self.highlights = {
    session = highlight.create_component_highlight_group(
      { fg = '#e0be7b' },
      'session_hl',
      self.options
    ),
    cwd = highlight.create_component_highlight_group(
      { fg = '#545ddf' },
      'session_cwd',
      self.options
    ),
    fg = highlight.create_component_highlight_group(
      { fg = '#5d5b68' },
      'session_fg',
      self.options
    ),
  }
end

function M:update_status()
  local session = vim.v.this_session

  local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
  local cwd_icon = '󰉋 '
  local cwd_hl = highlight.component_format_highlight(self.highlights.cwd)
  local fg_hl = highlight.component_format_highlight(self.highlights.fg)

  local final = cwd_hl .. cwd_icon .. fg_hl .. cwd

  if session ~= nil and string.len(session) > 0 then
    local session_name = vim.fn.fnamemodify(session, ':t') or ''
    local icon = '󰦛 '
    local hl = highlight.component_format_highlight(self.highlights.session)

    final = final .. '  ' .. hl .. icon .. fg_hl .. session_name
  end

  return final
end

return M
