return {
    "icewind/ltex-client.nvim",
    enabled = false,
    -- enabled = Is_Not_Win32,
    ft = { "tex", "bib", "markdown", "org" },
    config = function()
        require("ltex-client").setup()
    end,
}
