local separators = { left = '', right = '' }

local M = {}

M.order = {
  'mode',
  'file',
  'git',
  '%=',
  'lsp_msg',
  'recording',
  '%=',
  'diagnostics',
  'lsp',
  'session',
  'cwd',
  'cursor',
}

function M.recording_macro()
  local recording_register = vim.fn.reg_recording()
  if recording_register == '' then return '' end

  local separator = '%#St_recording_sep#' .. separators.left
  local icon = '%#St_recording_text#' .. '󰑋'
  local text = ' RECORDING'
  local separator_end = '%#St_recording_sep#' .. separators.right

  return separator .. icon .. text .. separator_end
end

function M.active_session()
  local session = vim.v.this_session
  if session == nil or string.len(session) == 0 then return '' end
  local session_name = vim.fn.fnamemodify(session, ':t')

  local separator = '%#St_session_sep#' .. separators.left
  local icon = '%#St_session_icon#' .. '󰆓 '
  local name = '%#St_session_text#' .. ' ' .. session_name
  local separator_end = '%#St_session_end#' .. separators.right .. ' '

  return separator .. icon .. name .. separator_end
end

return M
