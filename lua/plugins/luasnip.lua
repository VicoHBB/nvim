return {
    -- @WARN: Comment all on windows
    "L3MON4D3/LuaSnip",
    enabled = Is_Not_Win32,
    -- follow latest release.
    version = "v2.*",         -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_lua").lazy_load({
            paths = vim.fn.stdpath("config") .. "/lua/snippets"
        })
        -- Use C snippets on CPP
        require("luasnip").filetype_extend("cpp", { "c", "comments_c_style" })
        -- Use Verilog snippets on Systemverilog
        require("luasnip").filetype_extend("systemverilog", { "verilog", "comments_c_style" })
    end,
}
