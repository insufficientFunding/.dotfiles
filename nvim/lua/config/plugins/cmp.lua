return function()
  local cmp = require('cmp')

  local formatting_style = {
    fields = { "abbr", "kind" },

    format = function(entry, item)
      local kind = require('lspkind').cmp_format({
        mode = 'symbol_text',
        maxwidth = 50,
        show_labelDetails = true,
        symbol_map = { Copilot = '' },
      })(entry, item)

      kind.kind = item.kind

      return kind
    end,
  }

  local function border(hl_name)
    return {
      { '╭', hl_name },
      { '─', hl_name },
      { '╮', hl_name },
      { '│', hl_name },
      { '╯', hl_name },
      { '─', hl_name },
      { '╰', hl_name },
      { '│', hl_name },
    }
  end

  local options = {
    completion = {
      completeopt = 'menu,menuone',
    },

    window = {
      completion = {
        winhighlight = 'Normal:CmpPmenu,CursorLine:CmpSel,Search:None',
        scrollbar = true,
      },
      documentation = {
        border = border('CmpDocBorder'),
        winhighlight = 'Normal:CmpDoc',
      },
    },
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },

    formatting = formatting_style,

    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-e>'] = cmp.mapping.close(),
      ['<C-Space>'] = cmp.mapping(function(_)
        if cmp.visible() then
          cmp.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          })
        else
          cmp.complete()
        end
      end),

      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif require('luasnip').expand_or_jumpable() then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
        else
          fallback()
        end
      end, { 'i', 's' }),

      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif require('luasnip').jumpable(-1) then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
        else
          fallback()
        end
      end, { 'i', 's' }),
    },
    sources = {
      {
        name = 'nvim_lsp',
        entry_filter = function(entry, _)
          return cmp.lsp.CompletionItemKind.Text ~= entry:get_kind()
        end,
      },
      { name = 'luasnip' },
      { name = 'nvim_lua' },
      { name = 'path' },
      { name = 'nerdfont' },
    },
  }

  return options
end
