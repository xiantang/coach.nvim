-- main module file
local M = {}
local logger = require("coach.keylogger")
M.last = ""
M.logfile = vim.fn.expand(string.format("~/logfile_%s.log", vim.fn.getpid()))

M.config = {
  -- default config
  -- opt = "Hello!",
}

-- setup is the public method to setup your plugin
M.setup = function(args)
  -- you can define your setup function here. Usually configurations can be merged, accepting outside params and
  -- you can also put some validation here for those.
  M.config = vim.tbl_deep_extend("force", M.config, args or {})
  vim.api.nvim_create_user_command("UShouldUseStart", function()
    logger.run(M.logfile)
  end, {})
  vim.api.nvim_create_user_command("UShouldUseStop", function()
    logger.stop()
  end, {})
end

-- "hello" is a public method for the plugin
-- M.hello = function()
--   module.my_first_function()
-- end

return M
