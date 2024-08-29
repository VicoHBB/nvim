return {
  {                                                        -- ToggleTerm
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
      open_mapping = "<F2>",
    },
  },
  {                                                 -- ToggleTerm manager
    "ryanmsnyder/toggleterm-manager.nvim",
    event = "VeryLazy",
    config = function()
      local toggleterm_manager = require("toggleterm-manager")
      local actions = toggleterm_manager.actions

      toggleterm_manager.setup({
        mappings = {                                                              -- key mappings bound inside the telescope window
          i = {
            ["<Tab>"] = { action = actions.toggle_term, exit_on_action = false },  -- toggles terminal open/closed
            ["<C-i>"] = { action = actions.create_and_name_term, exit_on_action = false }, -- creates a new terminal buffer
            ["<C-d>"] = { action = actions.delete_term, exit_on_action = false }, -- deletes a terminal buffer
            ["<C-r>"] = { action = actions.rename_term, exit_on_action = false }, -- provides a prompt to rename a terminal
            ["<CR>"] = { action = actions.open_term, exit_on_action = true }, -- provides a prompt to rename a terminal
          },
        }
      })
    end,
  }
}
