return {
  'nvim-neo-tree/neo-tree.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  opts = {
    source_selector = {
      --winbar = true,
    },

    default_component_configs = {
      name = {
        use_git_status_colors = false,
      },

      indent = {
        indent_size = 2,
        padding = 0,
      },

      git_status = {
        symbols = {
          added = '',
          modified = '',
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
    nesting_rules = {
      ['pubspec'] = {
        pattern = 'pubspec.yaml',
        files = {
          'pubspec.lock',
        },
      },
      ['dart'] = {
        pattern = '(.+)%.dart$',
        files = {
          '%1.g.dart',
          '%1.freezed.dart',
          '%1.gr.dart',
        },
      },
      ['firebase'] = {
        pattern = 'firebase.json',
        files = {
          'firestore.rules',
          'firestore.indexes.json',
        },
      },
    },
    window = {
      mappings = {
        ['h'] = function(state)
          local node = state.tree:get_node()
          if node.type == 'directory' and node:is_expanded() then
            require('neo-tree.sources.filesystem').toggle_directory(state, node)
          else
            require('neo-tree.ui.renderer').focus_node(
              state,
              node:get_parent_id()
            )
          end
        end,
        ['l'] = function(state)
          local node = state.tree:get_node()
          if node.type == 'directory' then
            if not node:is_expanded() then
              require('neo-tree.sources.filesystem').toggle_directory(
                state,
                node
              )
            elseif node:has_children() then
              require('neo-tree.ui.renderer').focus_node(
                state,
                node:get_child_ids()[1]
              )
            end
          end
        end,

        ['<S-Tab>'] = 'prev_source',
        ['<Tab>'] = 'next_source',
      },
    },
    -- event_handlers = {
    --   {
    --     event = 'after_render',
    --     handler = function(state)
    --       if
    --         state.current_position == 'left'
    --         or state.current_position == 'right'
    --       then
    --         vim.api.nvim_win_call(state.winid, function()
    --           local str = require('neo-tree.ui.selector').get()
    --           if str then _G.__cached_neo_tree_selector = str end
    --         end)
    --       end
    --     end,
    --   },
    -- },
  },
  keys = {
    {
      '<leader>e',
      '<CMD> Neotree focus <CR>',
      desc = 'Focus on NeoTree',
    },
  },
}
