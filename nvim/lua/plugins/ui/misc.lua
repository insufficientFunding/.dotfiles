vim.g.foldtext = function()
  local ok = pcall(vim.treesitter.get_parser, vim.api.nvim_get_current_buf())
  local ret = ok and vim.treesitter.foldtext and vim.treesitter.foldtext()
  if not ret or type(ret) == 'string' then
    ret = {
      {
        vim.api.nvim_buf_get_lines(0, vim.v.lnum - 1, vim.v.lnum, false)[1],
        {},
      },
    }
  end

  local num_lines = ' [' .. vim.v.foldend - vim.v.foldstart + 1 .. ' lines]'
  table.insert(ret, { ' ' .. '─' .. num_lines, 'CursorColumn' })

  if not vim.treesitter.foldtext then
    return table.concat(
      vim.tbl_map(function(line)
        return line[1]
      end, ret),
      ' '
    )
  end

  return ret .. num_lines
end

return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      indent = {
        char = '│',
        highlight = { 'Whitespace' },
      },
      whitespace = {
        highlight = { 'Whitespace' },
        remove_blankline_trail = false,
      },
      scope = {
        show_start = false,
        show_end = false,
      },
    },
  },

  {
    'luukvbaal/statuscol.nvim',
    lazy = false,
    opts = function()
      local builtin = require('statuscol.builtin')

      return {
        ft_ignore = { 'NvimTree' },
        segments = {
          { text = { ' ' } },
          { text = { builtin.foldfunc } },
          { sign = { text = { '.*' } } },
          { text = { ' ' } },
          { text = { builtin.lnumfunc, ' ' } },
        },
      }
    end,
  },

  {
    'HiPhish/rainbow-delimiters.nvim',
  },
}
