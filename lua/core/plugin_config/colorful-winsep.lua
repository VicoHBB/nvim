require('colorful-winsep').setup({
	-- highlight for Window separator
	highlight = {
		fg = "#B8BB26",
		--bg = "#282828",
		--bg = "#16161E",
		--fg = "#1F3442",
	},
	-- timer refresh rate
	interval = 30,
	-- This plugin will not be activated for filetype in the following table.
	--no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", "NvimTree" },
	-- Symbols for separator lines, the order: horizontal, vertical, top left, top right, bottom left, bottom right.
	symbols = { "━", "┃", "┏", "┓", "┗", "┛" },
	-- symbols = { "━", "┃", "", "", "", "" },
})
