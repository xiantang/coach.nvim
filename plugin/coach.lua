-- vim.api.nvim_create_user_command("MyFirstFunction", require("coach").hello, {})

vim.api.nvim_create_user_command("UShouldUseStart", function()
  require("coach").logger.run()
  -- logger.run(M.logfile)
end, {})
vim.api.nvim_create_user_command("UShouldUseStop", function()
  require("coach").logger.stop()
end, {})
