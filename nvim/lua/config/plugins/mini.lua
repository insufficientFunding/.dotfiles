local M = {}

local sessions_config = {
  hooks = {
    pre = {
      write = function()
        local _, _ = pcall(function()
          vim.cmd('NvimTreeClose')
        end)
      end,
    },
  },
}

local surround_config = {
  mappings = {
    add = 'sa',
    delete = 'sd',
    find = 'sf',
    find_left = 'sF',
    highlight = 'sh',
    replace = 'sr',
    update_n_lines = 'sn',

    suffic_last = 'l',
    suffix_next = 'n',
  },
}

--- Setup the mini main plugin
function M.setup()
  require('mini.surround').setup()
  require('mini.sessions').setup(sessions_config)
  require('mini.move').setup({})
end

--- Open a field to select a name for the session to write
function M.write()
  local Input = require('nui.input')
  local event = require('nui.utils.autocmd').event

  local input = Input({
    position = '50%',
    size = {
      width = 30,
    },
    border = {
      style = 'rounded',
      text = {
        top = ' Write session ',
      },
    },
  }, {
    prompt = ' ',
    on_submit = function(value)
      if not value or value == '' then
        vim.notify('Session name cannot be empty', vim.log.levels.ERROR)
        return
      end

      require('mini.sessions').write(value)
    end,
  })

  input:mount()

  input:on(event.BufLeave, function()
    input:unmount()
  end)
end

return M
