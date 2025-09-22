return {
    "folke/todo-comments.nvim",
    enabled = true,
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    opts = {
    },
    keys = {
        {
            "<leader>td",
            function()
                vim.cmd("TodoQuickFix")
            end,
            mode = { "n" },
            silent = true,
            desc = "Toggle ToDo Comments on QuickFix"
        }
    }
}
