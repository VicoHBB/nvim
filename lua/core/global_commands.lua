-- Custom commands that only use vanilla Neovim; commands that depend on a
-- plugin live in that plugin's spec
local cmd = vim.api.nvim_create_user_command

cmd("PrintInitialDir", function()
    vim.notify(tostring(Initial_Dir), vim.log.levels.INFO)
end, {
    nargs = 0,
    desc = "Show the dir nvim was launched from",
})
