require('core.global_settings')

-- autocmds and keymaps can wait to load
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

require("core.lazy")

vim.cmd.colorscheme "gruvbox-material"
