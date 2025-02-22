--- @type table<Command.Callback>
return {
  {
    name = 'Redir',
    callback = function(ctx)
      local lines =
        vim.split(vim.api.nvim_exec(ctx.args, true), '\n', { plain = true })
      vim.cmd('new')
      vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
      vim.opt_local.modified = false
    end,
    args = { nargs = '+', complete = 'command' },
  },
}
