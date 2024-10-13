local M = {}

function M.on_attach(client, bufnr)
  require('config.plugins.lspconfig').on_attach(client, bufnr)
  vim.cmd('highlight FlutterWidgetGuides guifg=#505050')
end

function M.setup()
  require('flutter-tools').setup({
    widget_guides = { enabled = true },

    lsp = {
      on_attach = M.on_attach,
      settings = {
        lineLength = 120,
        renameFilesWithClasses = 'always',
        suggestFromUnimportedLibraries = false,
        completeFunctionCalls = false,
      },
    },

    dev_log = {
      enabled = true,
    },

    -- debugger = {
    --   enabled = false,
    --   run_via_dap = false,
    --   register_configurations = function(_)
    --     require('dap').adapters.dart = {
    --       type = 'executable',
    --       command = 'flutter',
    --       args = { 'debug_adapter' },
    --     }
    --
    --     require('dap').configurations.dart = {
    --       {
    --         type = 'dart',
    --         request = 'launch',
    --         name = 'Launch flutter',
    --         program = '${workspaceFolder}/lib/main.dart',
    --         cwd = '${workspaceFolder}',
    --       },
    --     }
    --   end,
    -- },
  })

  require('telescope').load_extension('flutter')
end
return M
