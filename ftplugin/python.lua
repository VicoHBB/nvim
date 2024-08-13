vim.wo.colorcolumn = "80"

local trim_spaces = false

vim.keymap.set("v", "<space>r", function()
    -- require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
    require("toggleterm").send_lines_to_terminal("visual_lines", trim_spaces, { args = 2 })
end)


vim.keymap.set("n", "<leader>r", function()
    require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = 2 })
end)

vim.keymap.set("n", "<F10>", "<CMD>2TermExec cmd='ipython --no-autoindent'<CR> name='REPL'", {silent = true})
