return {
    "ibhagwan/fzf-lua",
    enbled = true,
    lazy = true,
    cmd = "FzfLua",
    -- evvent = "VeryLazy",
    -- optional for icon support
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        -- "echasnovski/mini.icons",
    },
    opts = function(_, opts)
        local fzf     = require('fzf-lua')
        local config  = fzf.config
        local actions = fzf.actions
        local keyset  = vim.keymap.set

        local default_actions = {
            ["enter"]  = actions.file_edit,
            ["alt-q"]  = actions.file_sel_to_qf,
            ["ctrl-s"] = actions.file_split,
            ["ctrl-v"] = actions.file_vsplit,
            ["ctrl-t"] = actions.file_tabedit,
            ["ctrl-q"] = actions.file_sel_to_qf,
            ["alt-Q"]  = actions.file_sel_to_ll,
            ["alt-i"]  = actions.toggle_ignore,
            ["alt-h"]  = actions.toggle_hidden,
        }

        local winopts_files_default = {
            height  = 0.40,
            width   = 0.60,
            preview = {
                layout = "vertical",
                vertical = "down:75%",
                hidden = true,
            }
        }

        local winopts_nvim_default                    = {
            row     = 0.15,
            height  = 0.55,
            width   = 0.35,
            preview = {
                layout = "vertical",
                vertical = "down:75%",
                hidden = true,
            }
        }

        local winopts_cursor_default = {
            relative = "cursor",
            height   = 0.40,
            width    = 0.50,
            preview  = {
                layout = "flex",
                vertical = "down:75%",
                hidden = true,
            }
        }

        local function fast_move(direction, times)
            return string.rep( direction, times)
        end

        -- [[ globlas ]]
        -- config.defaults.fzf_bin = 'sk'

        -- [[ winopts ]]

        -- All win
        config.defaults.winopts.height = 0.85
        config.defaults.winopts.width  = 0.80
        config.defaults.winopts.row    = 0.50
        config.defaults.winopts.col    = 0.50

        --  Preview
        config.defaults.winopts.preview.vertical       = "down:45%"
        config.defaults.winopts.preview.horizontal     = "right:60%"
        config.defaults.winopts.preview.winopts.number = true
        config.defaults.winopts.preview.winopts.wrap   = true

        config.defaults.winopts.on_create              = function()
            keyset({ "t", 'i' }, "<C-j>", "<Down>", { silent = true, buffer = true })
            keyset({ "t", "i" }, "<C-k>", "<Up>", { silent = true, buffer = true })
            keyset({ "t", 'i' }, "<C-d>", fast_move("<Down>", 5), { silent = true, buffer = true })
            keyset({ "t", "i" }, "<C-u>", fast_move("<Up>", 5), { silent = true, buffer = true })
            -- @NOTE: This prevent to move to an split, need to check(Need review)
            keyset({ "t", 'i' }, "<C-h>", "", { silent = true, buffer = true })
            keyset({ "t", "i" }, "<C-l>", "", { silent = true, buffer = true })
        end

        -- [[ keymaps ]]

        -- builtin
        config.defaults.keymap.builtin["<c-f>"] = "preview-page-down"
        config.defaults.keymap.builtin["<c-b>"] = "preview-page-up"
        config.defaults.keymap.builtin["<c-space>"] = "toggle-preview"
        config.defaults.keymap.builtin["<a-m>"] = "toggle-fullscreen"
        config.defaults.keymap.builtin["<c-r>"] = "toggle-preview-cw"
        config.defaults.keymap.builtin["<a-r>"] = "toggle-preview-ccw"
        config.defaults.keymap.builtin["<c-w>"] = "toggle-preview-wrap"

        -- fzf
        config.defaults.keymap.fzf["ctrl-f"] = "preview-page-down"
        config.defaults.keymap.fzf["ctrl-b"] = "preview-page-up"
        config.defaults.keymap.fzf["ctrl-space"] = "toggle-preview"
        config.defaults.keymap.fzf["ctrl-w"] = "toggle-preview-wrap"

        -- [[ actions ]]
        config.defaults.actions.files = default_actions

        -- [[ Pickers ]]

        -- Files
        config.defaults.files.winopts = winopts_files_default
        -- Old Files
        config.defaults.oldfiles.winopts = winopts_files_default
        -- Git Files
        config.defaults.git.icons = {
            ["M"] = { icon = "★", color = "red" },
            ["D"] = { icon = "✗", color = "red" },
            ["A"] = { icon = "+", color = "green" },
        }
        config.defaults.git.files.winopts = winopts_files_default

        config.defaults.builtin.winopts = winopts_files_default

        config.defaults.blines.winopts = {
            layout = "vertical",
            preview = {
                hidden = true,
            }
        }

        -- Neovim Pickers
        config.defaults.commands.winopts        = winopts_nvim_default
        config.defaults.command_history.winopts = winopts_nvim_default
        config.defaults.search_history.winopts  = winopts_nvim_default
        config.defaults.nvim_options.winopts    = winopts_nvim_default
        config.defaults.helptags.winopts        = {
            preview = {
                layout = "vertical",
                vertical = "down:80%",
                wrap = true,
            }
        }

        -- TAGS
        config.defaults.tags.winopts = winopts_cursor_default

        -- [[ Integrations ]]

        -- LSP
        config.defaults.lsp.winopts = winopts_cursor_default

        -- LSP finder
        config.defaults.lsp.finder.winopts = winopts_cursor_default

        -- Code Actions
        config.defaults.lsp.code_actions.winopts = {
            relative = "cursor",
            row      = 1,
            col      = 0,
            height   = 0.30,
            width    = 0.40,
            preview  = {
                layout     = "flex",
                wrap       = true, -- preview line wrap (fzf's 'wrap|nowrap')
                vertical   = "down:75%",
                horizontal = "right:75%",
                hidden     = true,
                winopts    = {
                    number = true
                }
            }
        }

        -- Spell Suggest
        config.defaults.spell_suggest.winopts = {
            relative = "cursor",
            row      = 1,
            col      = 0,
            height   = 0.25,
            width    = 0.25,
        }

        require('fzf-lua').register_ui_select({
            winopts = winopts_nvim_default
        })
    end,
    keys = {
        {
            "<F1>",
            function()
                require('fzf-lua').help_tags()
            end,
            mode = { 'n' },
            silent = true,
            desc = "Help Tags",
        },
        {
            "z=",
            function()
                require('fzf-lua').spell_suggest()
            end,
            mode = { 'n' },
            silent = true,
            desc = "Spell Suggest",
        },
        {
            "<leader>fr",
            function()
                require('fzf-lua').resume()
            end,
            mode = { 'n' },
            silent = true,
            desc = "FZFLua Resume Last Builtin",
        },
        {
            "<leader>fz",
            function()
                require('fzf-lua').builtin()
            end,
            mode = { 'n' },
            silent = true,
            desc = "FZFLua Builtin",
        },
        {
            "<leader>ff",
            function()
                require('fzf-lua').files()
            end,
            mode = { 'n' },
            silent = true,
            desc = "FZFLua Find Files",
        },
        {
            "<leader>fu",
            function()
                local filename = vim.fn.expand("<cword>")
                require('fzf-lua').files({
                    query = filename,
                })
            end,
            mode = { 'n' },
            silent = true,
            desc = "FZFLua Find File Under Cursor",
        },
        {
            "<leader>fu",
            function()

                local reg, visual_selection

                reg = vim.fn.getreg('"')
                vim.cmd('normal! "vy')
                visual_selection = vim.fn.getreg('"')
                vim.fn.setreg('v', reg)

                require('fzf-lua').files({
                    query = visual_selection,
                })
            end,
            mode = { 'v' },
            silent = true,
            desc = "FZFLua Find File Visual Selection",
        },
        {
            "<leader>fo",
            function()
                require('fzf-lua').oldfiles()
            end,
            mode = { 'n' },
            silent = true,
            desc = "FZFLua Old Files",
        },
        {
            "<leader>fg",
            function()
                require('fzf-lua').git_files()
            end,
            mode = { 'n' },
            silent = true,
            desc = "FZFLua Git Files",
        },
        {
            "<leader>fc",
            function()
                require('fzf-lua').commands()
            end,
            mode = { 'n' },
            silent = true,
            desc = "FZFLua Commands",
        },
        {
            "<leader>fl",
            function()
                require('fzf-lua').blines()
            end,
            mode = { 'n' },
            silent = true,
            desc = "FZFLua Lines",
        },
        {
            "<leader>fh",
            function()
                require('fzf-lua').git_bcommits()
            end,
            mode = { 'n' },
            silent = true,
            desc = "FZFLua Buffer Commits",
        },
        {
            "<leader>\"",
            function()
                require('fzf-lua').registers()
            end,
            mode = { 'n' },
            silent = true,
            desc = "FZFLua Registers",
        },
        {
            "<leader>fv",
            function()
                require('fzf-lua').nvim_options()
            end,
            mode = { 'n' },
            silent = true,
            desc = "FZFLua nvim_options",
        },
        {
            "<leader>S",
            function()
                require('fzf-lua').live_grep()
            end,
            mode = { 'n' },
            silent = true,
            desc = "FZFLua Search (live grep)",
        },
        {
            "gs",
            function()
                require('fzf-lua').grep_cword()
            end,
            mode = { 'n' },
            silent = true,
            desc = "FZFLua Search Exact Word under cursor",
        },
        {
            "gS",
            function()
                require('fzf-lua').grep_cWORD()
            end,
            mode = { 'n' },
            silent = true,
            desc = "FZFLua Search Word",
        },
        {
            "gs",
            function()
                require('fzf-lua').grep_visual()
            end,
            mode = { 'v' },
            silent = true,
            desc = "FZFLua Search (Visual Selection)",
        },
        {
            "<leader>ft",
            function()
                require('fzf-lua').tags()
            end,
            mode = { 'n' },
            silent = true,
            desc = "FZFLua Tags",
        },
        {
            "g]",
            function()
                require('fzf-lua').tags_grep_cword()
            end,
            mode = { 'n' },
            silent = true,
            desc = "FZFLua Tag under cursor",
        },
        {
            "g]",
            function()
                require('fzf-lua').tags_grep_visual()
            end,
            mode = { 'v' },
            silent = true,
            desc = "FZFLua Tag (Visual Selection)",
        },
        -- For projects that does not configure properly
        {
            "<leader>fi",
            function()
                require('fzf-lua').files({
                    cwd = Initial_Dir,
                })
            end,
            mode = { 'n' },
            silent = true,
            desc = "FZFLua Find Files (Initial Dir)",
        },
        {
            "<leader>fU",
            function()
                local filename = vim.fn.expand("<cword>")
                require('fzf-lua').files({
                    query = filename,
                    cwd = Initial_Dir,
                })
            end,
            mode = { 'n' },
            silent = true,
            desc = "FZFLua Find File Under Cursor (Initial Dir)",
        },
        {
            "<leader>fU",
            function()

                local reg, visual_selection

                reg = vim.fn.getreg('"')
                vim.cmd('normal! "vy')
                visual_selection = vim.fn.getreg('"')
                vim.fn.setreg('v', reg)

                require('fzf-lua').files({
                    query = visual_selection,
                    cwd = Initial_Dir,
                })
            end,
            mode = { 'v' },
            silent = true,
            desc = "FZFLua Find File Visual Selection (Initial Dir)",
        },
        {
            "<leader>gi",
            function()
                require('fzf-lua').grep_cword({
                    cwd = Initial_Dir,
                })
            end,
            mode = { 'n' },
            silent = true,
            desc = "FZFLua Search Exact Word under cursor (Initial Dir)",
        },
        {
            "<leader>gi",
            function()
                require('fzf-lua').grep_visual({
                    cwd = Initial_Dir,
                })
            end,
            mode = { 'v' },
            silent = true,
            desc = "FZFLua Search - Visual Selection (Initial Dir)",
        },
        {
            "<Space>gI",
            function()
                require('fzf-lua').live_grep({
                    cwd = Initial_Dir,
                })
            end,
            mode = { 'n' },
            silent = true,
            desc = "FZFLua Search Word (Initial Dir)",
        },
    }
}
