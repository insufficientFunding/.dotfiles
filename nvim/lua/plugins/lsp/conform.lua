return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>rf',
        function()
          require('conform').format({ async = true, lsp_fallback = true })
        end,
        mode = 'n',
        desc = 'Format buffer',
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        dart = { 'dart_format' },
        json = { 'prettier' },
        jsonc = { 'prettier' },
      },

      formatters = {
        stylua = {
          prepend_args = {
            '--indent-type',
            'Spaces',
            '--indent-width',
            '2',
          },
        },
      },

      format_on_save = { timeout_ms = 500, lsp_fallback = true },
    },

    init = function()
      vim.opt.formatexpr = 'v:lua.require"conform".formatexpr()'
    end,
  },
}
