# coach.nvim 🚧 WIP 🚧

Coach is a plugin for Neovim designed to help you identify and correct inefficient Vim usage habits, thereby enabling you to accomplish more tasks with fewer keystrokes. For instance, if you find yourself repetitively typing 'jjjj' or 'kkkk' in normal mode, Coach will gently remind you that you can use '4j' or '4k' instead. By adopting these efficient practices, you can enhance your productivity and streamline your coding experience.
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

