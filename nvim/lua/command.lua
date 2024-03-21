--- @class Command.Callback
--- @field name string
--- @field callback function
--- @field args vim.api.keyset.user_command
--- @field buffer integer?

--- @class Command
local M = {}

--- Create a user command
--- @param name string
--- @param callback function|string
--- @param args vim.api.keyset.user_command
function M:create_command(name, callback, args)
  vim.api.nvim_create_user_command(name, callback, args)
end

--- Create a buffer command
--- @param buffer number
--- @param name string
--- @param callback function|string
--- @param args vim.api.keyset.user_command
function M:create_buffer_command(buffer, name, callback, args)
  vim.api.nvim_buf_create_user_command(buffer, name, callback, args)
end

--- @param commands table<Command.Callback>
function M:setup(commands)
  for _, command in pairs(commands) do
    if command.buffer then
      self:create_buffer_command(
        command.buffer,
        command.name,
        command.callback,
        command.args
      )
    else
      self:create_command(command.name, command.callback, command.args)
    end
  end
end

return M
