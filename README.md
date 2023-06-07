# coach.nvim

Coach is a plugin for [Neovim](https://neovim.io/) 
帮助你找到不好的 vim 使用习惯，帮助你改正它们，用更少的按键完成更多的事情。
for example, When u are typing `jjjj` or `kkkk` in normal mode, coach will remind you that you can use `4j` or `4k` instead.

## Installation

```lua
return {
	{
		"xiantang/coach.nvim",
		dev = true,
		build = "bash ./install.sh",
		config = function()
			require("coach").setup()
		end,
	},
}
```


## Credits

- [nvim-plugin-template](https://github.com/ellisonleao/nvim-plugin-template)

