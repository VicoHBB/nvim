-- Dir nvim was launched from, captured before nvim-rooter can change the cwd;
-- fzf-lua pickers use it to search from here instead of the project root
Initial_Dir = vim.fn.getcwd()

-- [[ Run global settings ]]
require('core.global_settings')

-- Autocmds deferred to VeryLazy miss events fired during startup (e.g. BufReadPost
-- of files passed on the cmdline); with args, load them right away (LazyVim trick)
if vim.fn.argc(-1) > 0 then
    require("core.autocmds")
end

-- [[ autocmds and keymaps can wait to load  ]]
vim.api.nvim_create_autocmd("User", {
    group = vim.api.nvim_create_augroup("LazyVim", { clear = true }),
    pattern = "VeryLazy",
    callback = function()
        require("core.folds")
        require("core.autocmds") -- no-op when already loaded at startup (require caches)
        require("core.global_keymaps")
        require("core.global_commands")
        require("core.diagnostics")
    end,
})

-- [[ Lazy ]]
require("core.lazy")
