return {
    -- "sindrets/diffview.nvim",
    "dlyongemallo/diffview.nvim",
    enabled = true,
    version = "*",
    cmd = {
        "DiffviewOpen",
        "DiffviewToggle",
        "DiffviewFileHistory",
        "DiffviewDiffFiles",
        "DiffviewLog",
    },
    keys = {
        {
            "<leader>gD",
            function()
                vim.cmd("DiffviewOpen --untracked-files")
            end,
            mode = { "n" },
            silent = true,
            desc = "Git Diff"
        },
        {
            "<leader>gh",
            function()
                vim.cmd("DiffviewFileHistory %")
            end,
            mode = { "n" },
            silent = true,
            desc = "Git Diff File History"
        },
    }
}
