-- Query for pickers: visual selection if active, otherwise the word under the cursor
local function cword_or_visual()
    if vim.fn.mode() == 'v' or vim.fn.mode() == 'V' then
        local reg = vim.fn.getreg('"')
        vim.cmd('normal! "vy')
        local query = vim.fn.getreg('v')
        vim.fn.setreg('"', reg)
        return query
    end
    return vim.fn.expand("<cword>")
end

return {
    "ibhagwan/fzf-lua",
    enabled = true,
    lazy = true,
    cmd = "FzfLua",
    -- optional for icon support
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        -- "echasnovski/mini.icons",
    },
    opts = function()
        local actions = require('fzf-lua').actions
        local keyset  = vim.keymap.set
        local jump_flash_ns = vim.api.nvim_create_namespace("jump_flash")

        local function flash_line()
            local bufnr = vim.api.nvim_get_current_buf()
            local line  = vim.api.nvim_win_get_cursor(0)[1] - 1
            vim.api.nvim_buf_set_extmark(bufnr, jump_flash_ns, line, 0, {
                end_row  = line + 1,
                hl_group = "Search",
            })
            vim.defer_fn(function()
                vim.api.nvim_buf_clear_namespace(bufnr, jump_flash_ns, 0, -1)
            end, 300)
        end

        local function jump_and_flash(selected, opts)
            actions.file_edit(selected, opts)
            vim.schedule(flash_line)
        end

        local function mark_and_flash(selected, opts)
            actions.goto_mark(selected, opts)
            vim.schedule(flash_line)
        end

        local default_actions = {
            ["enter"]  = jump_and_flash,
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
                -- files/git.files ship cursorline = false in their defaults; explicit
                -- here to keep the previous behavior (it inherited the global true)
                winopts = { cursorline = true },
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

        return {
            -- [[ globals ]]
            -- fzf_bin = 'sk',
            jump1_action = jump_and_flash, -- flash on auto-jump (single result)

            -- [[ winopts ]]
            winopts = {
                height  = 0.85,
                width   = 0.80,
                row     = 0.50,
                col     = 0.50,
                preview = {
                    vertical   = "down:45%",
                    horizontal = "right:60%",
                    winopts    = {
                        number = true,
                        wrap   = true,
                    },
                },
                on_create = function()
                    keyset({ "t", 'i' }, "<C-j>", "<Down>", { silent = true, buffer = true })
                    keyset({ "t", "i" }, "<C-k>", "<Up>", { silent = true, buffer = true })
                    keyset({ "t", 'i' }, "<C-d>", fast_move("<Down>", 5), { silent = true, buffer = true })
                    keyset({ "t", "i" }, "<C-u>", fast_move("<Up>", 5), { silent = true, buffer = true })
                    -- @NOTE: This prevent to move to an split, need to check(Need review)
                    keyset({ "t", 'i' }, "<C-h>", "", { silent = true, buffer = true })
                    keyset({ "t", "i" }, "<C-l>", "", { silent = true, buffer = true })
                end,
            },

            -- [[ keymaps ]]
            keymap = {
                -- [1] = true inherits the default binds; without it the table replaces them
                builtin = {
                    true,
                    ["<c-f>"]     = "preview-page-down",
                    ["<c-b>"]     = "preview-page-up",
                    ["<c-space>"] = "toggle-preview",
                    ["<a-m>"]     = "toggle-fullscreen",
                    ["<c-r>"]     = "toggle-preview-cw",
                    ["<a-r>"]     = "toggle-preview-ccw",
                    ["<c-w>"]     = "toggle-preview-wrap",
                },
                fzf = {
                    true,
                    ["ctrl-f"]     = "preview-page-down",
                    ["ctrl-b"]     = "preview-page-up",
                    ["ctrl-space"] = "toggle-preview",
                    ["ctrl-w"]     = "toggle-preview-wrap",
                },
            },

            -- [[ actions ]]
            actions = {
                files = default_actions,
            },

            -- [[ Pickers ]]
            files    = { winopts = winopts_files_default },
            oldfiles = { winopts = winopts_files_default },
            git      = {
                icons = {
                    ["M"] = { icon = "★", color = "red" },
                    ["D"] = { icon = "✗", color = "red" },
                    ["A"] = { icon = "+", color = "green" },
                },
                files = { winopts = winopts_files_default },
            },
            builtin  = { winopts = winopts_files_default },
            blines   = {
                winopts = {
                    layout  = "vertical",
                    preview = {
                        hidden = true,
                    },
                },
            },

            -- Neovim Pickers
            commands        = { winopts = winopts_nvim_default },
            command_history = { winopts = winopts_nvim_default },
            search_history  = { winopts = winopts_nvim_default },
            nvim_options    = { winopts = winopts_nvim_default },
            helptags        = {
                winopts = {
                    preview = {
                        layout = "vertical",
                        vertical = "down:80%",
                        wrap = true,
                    },
                },
            },

            -- TAGS
            tags = { winopts = winopts_cursor_default },

            -- [[ Integrations ]]

            -- LSP
            lsp = {
                winopts      = winopts_cursor_default,
                jump1_action = jump_and_flash, -- redundant with defaults.jump1_action, kept for clarity
                finder       = { winopts = winopts_cursor_default },
                code_actions = {
                    winopts = {
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
                    },
                },
            },

            -- Spell Suggest
            spell_suggest = {
                winopts = {
                    relative = "cursor",
                    row      = 1,
                    col      = 0,
                    height   = 0.25,
                    width    = 0.25,
                },
            },

            -- Buffers
            buffers = { winopts = winopts_files_default },

            -- Marks
            marks = {
                winopts = {
                    preview = {
                        layout = "vertical",
                        vertical = "down:70%",
                        -- hidden = true,
                    },
                },
                actions      = { ["enter"] = mark_and_flash }, -- merge: preserves ctrl-s/v/t/x
                jump1_action = mark_and_flash,
            },
        }
    end,
    config = function(_, opts)
        local fzf = require('fzf-lua')
        fzf.setup(opts)
        fzf.register_ui_select({
            -- same table as winopts_nvim_default (shared by the nvim pickers)
            winopts = opts.commands.winopts,
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
            "<leader>fb",
            function()
                require('fzf-lua').buffers()
            end,
            mode = { 'n' },
            silent = true,
            desc = "FZFLua Buffers",
        },
        {
            "<leader>fu",
            function()
                require('fzf-lua').files({ query = cword_or_visual() })
            end,
            mode = { 'n', 'v' },
            silent = true,
            desc = "FZFLua Find File Under Cursor / Selection",
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
            "<leader>fm",
            function()
                require('fzf-lua').marks({ jump1 = true })
            end,
            mode = { 'n' },
            silent = true,
            desc = "FZFLua Marks",
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
                require('fzf-lua').tags_grep_cword({ jump1 = true })
            end,
            mode = { 'n' },
            silent = true,
            desc = "FZFLua Tag under cursor",
        },
        {
            "g]",
            function()
                require('fzf-lua').tags_grep_visual({ jump1 = true })
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
                require('fzf-lua').files({ query = cword_or_visual(), cwd = Initial_Dir })
            end,
            mode = { 'n', 'v' },
            silent = true,
            desc = "FZFLua Find File Under Cursor / Selection (Initial Dir)",
        },
        {
            "<leader>gi",
            function()
                if vim.fn.mode() == 'v' or vim.fn.mode() == 'V' then
                    require('fzf-lua').grep_visual({ cwd = Initial_Dir })
                else
                    require('fzf-lua').grep_cword({ cwd = Initial_Dir })
                end
            end,
            mode = { 'n', 'v' },
            silent = true,
            desc = "FZFLua Search Word / Selection (Initial Dir)",
        },
        {
            "<leader>gI",
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
