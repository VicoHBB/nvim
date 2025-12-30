return {
    'nvimdev/lspsaga.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    },
    config = function()
        require('lspsaga').setup({
            ui = {
                code_action = ' ',
            },
            diagnostic = {
                show_layout = 'normal',
                keys = {
                    toggle_or_jump = '<CR>',
                },
            },
            code_action = {
                extend_gitsigns = true,
            },
            lightbulb = {
                virtual_text = false,
            },
            finder = {
                keys = {
                    shuttle = '<C-e>',
                    toggle_or_open = '<CR>',
                    vsplit = '<C-v>',
                    split = '<C-s>',
                    tabe = '<C-t>',
                    quit = 'q',
                },
            },
            definition = {
                keys = {
                    edit = '<CR>',
                    vsplit = '<C-v>',
                    split = '<C-x>',
                    tabe = '<C-t>',
                },
            },
            rename = {
                in_select = true,
                auto_save = true,
                keys = {
                    quit = '<C-c>',
                    exec = '<CR>',
                },
            },
            outline = {
                keys = {
                    toggle_or_jump = '<CR>',
                    quit = 'q',
                    jump = 'e',
                },
            },
            callhierarchy = {
                layout = 'float',
                left_width = 0.2,
                keys = {
                    edit = '<CR>',
                    vsplit = '<C-v',
                    split = '<C-s>',
                    tabe = '<C-t>',
                    shuttle = '<C-e>',
                },
            },
            typehierarchy = {
                layout = 'float',
                left_width = 0.2,
                keys = {
                    edit = 'e',
                    vsplit = '<C-v>',
                    split = '<C-s>',
                    tabe = '<C-t>',
                    close = '<C-c>',
                    shuttle = '<C-e>',
                },
            },
        })
    end,
}
