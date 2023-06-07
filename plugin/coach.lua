-- vim.api.nvim_create_user_command("MyFirstFunction", require("coach").hello, {})
local coach = require("coach")
local logger = require("coach").logger
vim.api.nvim_create_user_command("UShouldUseStart", function()
  logger.run(coach.logfile)
end, {})
vim.api.nvim_create_user_command("UShouldUseStop", function()
  logger.stop(coach.logfile)
end, {})
