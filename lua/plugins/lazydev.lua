return {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
        library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            -- See the configuration section for more details
            "lazy.nvim",
            { path = "luvit-meta/library", words = { "vim%.uv" } },
            { path = "snacks.nvim",        words = { "Snacks" } },
            { path = "plenary.nvim",       words = { "describe" } },
            { path = "mini.nvim",          words = { "Mini%a+" } },
        },
    },
}
