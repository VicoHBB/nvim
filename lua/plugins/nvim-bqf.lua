return {
    'kevinhwang91/nvim-bqf',
    enabled = true,
    ft = { 'qf' },
    dependencies = {
        {
            "junegunn/fzf",
            dir = "~/.fzf",
            build = "./install --all",
        },
    },
    config = function()
        require('bqf').setup({
            auto_enable = true,
            auto_resize_height = true, --
            preview = {
                auto_preview = false,
            },
            fzf = {
                extra_opts = {
                    description = 'Extra options for fzf',
                    default = { '--bind', '--border', 'ctrl-o:toggle-all' }
                }
            }
        })
    end,
}
