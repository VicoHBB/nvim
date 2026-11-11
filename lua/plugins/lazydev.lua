return {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    dependencies = {
        -- LuaLS type stubs for wezterm/yazi configs; data-only, lazy.nvim
        -- just needs to install them for the library paths below to resolve
        { "DrKJeff16/wezterm-types", enabled = Is_Not_Win32 },
        { "yazi-rs/plugins", name = "yazi-plugins", enabled = Is_Not_Win32 },
    },
    opts = {
        library = {
            -- Load luvit types when the `vim.uv` word is found
            "lazy.nvim",
            { path = "${3rd}/luv/library",      words = { "vim%.uv" } },
            { path = "snacks.nvim",             words = { "Snacks" } },
            { path = "plenary.nvim",            words = { "describe" } },
            { path = "mini.nvim",               words = { "Mini%a+" } },
            { path = "wezterm-types",           mods = { "wezterm" } },
            { path = "yazi-plugins/types.yazi", words = { "%f[%w_]ya%.", "%f[%w_]cx%." } },
        },
    },
}
