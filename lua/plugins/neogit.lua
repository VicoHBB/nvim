return {
    "NeogitOrg/neogit",
    enabled = true,
    cmd = {
        "Neogit",
        "NeogitCommit",
        "DiffviewOpen",
        "DiffviewFileHistory"
    },
    dependencies = {
        "nvim-lua/plenary.nvim",  -- required
        "sindrets/diffview.nvim", -- optional - Diff integration

        -- Only one of these is needed, not both.
        "ibhagwan/fzf-lua",
    },
    config = true,
    keys = {
        {
            "<leader>gg",
            function()
                require("neogit").open()
            end,
            mode = { "n" },
            silent = true,
            desc = "Open Neogit"
        },
        -- @TODO: Chamges vim.cmd for lua function
        {
            "<leader>gc",
            function()
                vim.cmd("Neogit commit")
            end,
            mode = { "n" },
            silent = true,
            desc = "Git Commit"
        },
        {
            "<leader>gC",
            function()
                vim.cmd("NeogitCommit")
            end,
            mode = { "n" },
            silent = true,
            desc = "Git Show Last Commit"
        },
        {
            "<leader>gl",
            function()
                vim.cmd("Neogit log")
            end,
            mode = { "n" },
            silent = true,
            desc = "Git Log"
        },
        {
            "<leader>gp",
            function()
                vim.cmd("Neogit pull")
            end,
            mode = { "n" },
            silent = true,
            desc = "Git Pull"
        },
        {
            "<leader>gP",
            function()
                vim.cmd("Neogit push")
            end,
            mode = { "n" },
            silent = true,
            desc = "Git Push"
        },
        {
            "<leader>gd",
            function()
                vim.cmd("Neogit diff")
            end,
            mode = { "n" },
            silent = true,
            desc = "Git Diff"
        },
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
