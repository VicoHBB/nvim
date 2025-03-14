-- [[ Verify OS ]]
if vim.fn.has("win32") == 1 then
    Is_Not_Win32 = false
elseif vim.fn.has("unix") == 1 or vim.fn.has("mac") == 1 then
    Is_Not_Win32 = true
end

-- [[ Run global settings ]]
require('core.global_settings')

-- [[ autocmds and keymaps can wait to load  ]]
vim.api.nvim_create_autocmd("User", {
    group = vim.api.nvim_create_augroup("LazyVim", { clear = true }),
    pattern = "VeryLazy",
    callback = function()
        require("core.folds")
        require("core.autocmds")
        require("core.global_keymaps")
        require("core.diagnostics")
    end,
})

-- [[ Lazy ]]
require("core.lazy")
