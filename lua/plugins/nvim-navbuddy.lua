return {
    "hasansujon786/nvim-navbuddy",
    dependencies = {
        "SmiteshP/nvim-navic",
        -- "MunifTanjim/nui.nvim"
        {
            -- @TODO: This is a partial solution
            "pynappo/nui.nvim",
            branch = "support-winborder"
        },
    },
    opts = {
        lsp = {
            auto_attach = true,
        },
    }
}
