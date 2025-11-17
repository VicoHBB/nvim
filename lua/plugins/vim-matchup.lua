return {
    'andymass/vim-matchup',
    enabled = true,
    event = "VeryLazy",
    init = function()
        -- modify your configuration vars here
        vim.g.matchup_treesitter_stopline = 500
        vim.g.matchup_matchparen_offscreen = { method = "popup" }
        vim.g.loaded_matchit = 1
    end,
    opts = {
        treesitter = {
            stopline = 500,
        }
    }
}
