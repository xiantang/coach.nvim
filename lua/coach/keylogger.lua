-- module represents a lua module for the plugin

local keylogger
local M = {}

function M.run(logfile)
  if keylogger then
    vim.fn.jobstop(keylogger)
  end
  local args = { "keylogger", logfile }
  keylogger = vim.fn.jobstart(args)
end

function M.stop(opts)
  if keylogger then
    vim.fn.jobstop(keylogger)
  end
end

M.my_first_function = function()
  print("hello")
end

return M
