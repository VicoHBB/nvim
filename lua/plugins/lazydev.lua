return {
    "folke/lazydev.nvim",
    enabled = true,
    ft = "lua", -- only load on lua files
    opts = {
        library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            -- See the configuration section for more details
            { path = "luvit-meta/library", words = { "vim%.uv" } },
            { path = "snacks.nvim",        words = { "Snacks" } },
            { path = "lazy.nvim",          words = { "LazyVim" } },
        },
    },
}
