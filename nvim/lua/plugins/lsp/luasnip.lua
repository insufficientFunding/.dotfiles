return {
  'L3MON4D3/LuaSnip',
  event = 'InsertEnter',
  opts = {
    history = true,
    updateevents = 'TextChanged,TextChangedI',
  },
  config = function(_, opts)
    require('luasnip').config.set_config(opts)
    require('config.plugins.luasnip').setup()
  end,
}
