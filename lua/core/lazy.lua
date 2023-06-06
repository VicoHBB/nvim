local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Put the plugins here
local plugins = {
  spec = {
    { import = "plugins" },
  },
  checker = { enabled = true, notify = false },
  ui = {
    border = "rounded",
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "nvim-lint",
        "formatter",
      },
    },
  },
}

local opts = {}

require("lazy").setup(plugins, opts)
