return {
	'Pocco81/true-zen.nvim',
	config = function()
		require("true-zen").setup ({
        -- your config goes here
        -- or just leave it empty :)
      	modes = { -- configurations per mode
        ataraxis = {
          shade = "dark", -- if `dark` then dim the padding windows, otherwise if it's `light` it'll brighten said windows
          backdrop = 0, -- percentage by which padding windows should be dimmed/brightened. Must be a number between 0 and 1. Set to 0 to keep the same background color
          minimum_writing_area = { -- minimum size of main window
            width = 70,
            height = 170,
          },
          quit_untoggles = true, -- type :q or :qa to quit Ataraxis mode
          padding = { -- padding windows
            left = 52,
            right = 52,
            top = 0,
            bottom = 0,
          },
          callbacks = { -- run functions when opening/closing Ataraxis mode
            open_pre = nil,
            open_pos = nil,
            close_pre = nil,
            close_pos = nil
          },
        },
        narrow = {
          --- change the style of the fold lines. Set it to:
          --- `informative`: to get nice pre-baked folds
          --- `invisible`: hide them
          --- function() end: pass a custom func with your fold lines. See :h foldtext
          folds_style = "informative",
          run_ataraxis = true, -- display narrowed text in a Ataraxis session
          callbacks = { -- run functions when opening/closing Narrow mode
            open_pre = nil,
            open_pos = nil,
            close_pre = nil,
            close_pos = nil
          },
        },
        focus = {
          callbacks = { -- run functions when opening/closing Focus mode
            open_pre = nil,
            open_pos = nil,
            close_pre = nil,
            close_pos = nil
          },
        }
      },
      integrations = {
        tmux = false, -- hide tmux status bar in (minimalist, ataraxis)
        kitty = { -- increment font size in Kitty. Note: you must set `allow_remote_control socket-only` and `listen_on unix:/tmp/kitty` in your personal config (ataraxis)
          enabled = false,
          font = "+3"
        },
        twilight = false, -- enable twilight (ataraxis)
        lualine = false -- hide nvim-lualine (ataraxis)
      },
		 })
	end,
}
