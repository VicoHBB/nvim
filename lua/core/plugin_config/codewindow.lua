require('codewindow').setup({
	width_multiplier = 1,   -- How many characters one dot represents
	z_index = 1,            -- The z-index the floating window will be on
	show_cursor = true,     -- Show the cursor position in the minimap
	window_border = 'single' -- The border style of the floating
	-- window (accepts all usual options)
})

require('codewindow').apply_default_keybinds()
