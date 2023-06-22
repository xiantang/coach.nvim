-- main module file
local M = {}
local logger = require("coach.keylogger")
M.logger = logger
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
  logger.run(M.logfile)
  vim.api.nvim_create_autocmd({ "CursorMoved", "TextYankPost", "InsertEnter" }, {
    pattern = { "*" },
    callback = function(env)
      -- read last line of  ~/logfile.txt
      local lastchars = vim.fn.system("tail -c 30 " .. M.logfile)
      local async = require("plenary.async")
      local notify = require("notify").async
      local function check(regex, recommand, wrong)
        if string.match(lastchars, regex) then
          -- avoid send notification too often
          async.run(function()
            local s = string.format("you should use %s instead of %s", recommand, wrong)
            if M.last == s then
              return
            end
            notify(s, vim.log.levels.WARN, {
              title = "coach.nvim",
              render = "compact",
              timeout = 500,
              on_open = function(win)
                local buf = vim.api.nvim_win_get_buf(win)
                vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
              end,
            })
            M.last = s
          end, function() end)
          return true
        end
      end
      if env.event == "CursorMoved" then
        if check("bbbb$", "F<key>", "bbbb") then
          return
        end
        if check("eeee$", "f<key>", "eeee") then
          return
        end
        if check("jjjj$", "<count>j", "jjjj") then
          return
        end
        if check("kkkk$", "<count>k", "kkkk") then
          return
        end
      end
      if env.event == "InsertEnter" then
        if check("0i", "I", "0i") then
          return
        end
        if check("%[left%-shift%]4a", "A", "$a") then
          return
        end
        if check("c%[left%-shift%]4$", "C", "c$") then
          return
        end
      end
      if env.event == "TextYankPost" then
        if check("y%[left%-shift%]4$", "Y", "y$") then
          return
        end
        if check("vi%[left%-shift%]%[%[left%-shift%]y", "yi{", "vi{y") then
          return
        end
        -- ya{
        if check("va%[left%-shift%]%[%[left%-shift%]y", "ya{", "va{y") then
          return
        end
        if check("vafy", "yaf", "vafy") then
          return
        end
        if check("d%[left%-shift%]4$", "D", "d$") then
          return
        end
        return
      end
    end,
  })
end

return M
