return {
    "OXY2DEV/helpview.nvim",
    enabled = true,
    lazy = false,  -- plugin as it is already lazy-loaded.
    opts = {
        preview = {
            filetypes = {
                "help",
                "checkhealth"
            },
        }
    }
};
