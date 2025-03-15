return {
    "NeogitOrg/neogit",
    enabled = true,
    cmd = "Neogit",
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
            "<leader>gp",
            function()
                vim.cmd("Neogit commit")
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
    }
}
