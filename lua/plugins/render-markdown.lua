return {
    'MeanderingProgrammer/render-markdown.nvim',
    enabled = true,
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons'
    },
    ft = { 'markdown' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        latex = {
            position = 'below'
        },
    },
}
