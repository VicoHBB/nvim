return {
    -- @NOTE: Conserve this file because blink.cmp is on development
    "hrsh7th/nvim-cmp",
    enabled = false,
    event = {
        -- "VeryLazy",
        "InsertEnter",
        "CmdlineEnter"
    },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-cmdline",
        "onsails/lspkind-nvim",
        "f3fora/cmp-spell",
        "lukas-reineke/cmp-under-comparator",
        "saadparwaiz1/cmp_luasnip",
        {
            'tzachar/cmp-fuzzy-buffer',
            dependencies = {
                'tzachar/fuzzy.nvim'
            }
        },
        {
            'tzachar/cmp-fuzzy-path',
            dependencies = {
                'tzachar/fuzzy.nvim'
            }
        },
    },
    config = function()
        local cmp         = require('cmp')            -- Set up nvim-cmp
        local lspkind     = require('lspkind')        -- Pretty Printing Menu Items
        local compare     = require('cmp.config.compare') -- Sorting
        local select_opts = { behavior = cmp.SelectBehavior.Select }
        local ls          = require("luasnip")


        -- UltiSnips
        -- require("cmp_nvim_ultisnips").setup({})

        cmp.setup({

            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                end,
            },

            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },

            mapping = {
                ['<C-b>']     = cmp.mapping.scroll_docs(-6),
                ['<C-f>']     = cmp.mapping.scroll_docs(6),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>']     = cmp.mapping.abort(),
                ['<CR>']      = cmp.mapping.confirm({ select = true }),
                ['<Tab>']     = cmp.mapping(function(fallback)
                    local col = vim.fn.col('.') - 1

                    if cmp.visible() then
                        cmp.select_next_item(select_opts)
                    elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                        fallback()
                    else
                        cmp.complete()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>']   = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item(select_opts)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<C-j>']     = function()
                    if ls.expand_or_jumpable() then
                        ls.expand_or_jump()
                    end
                end,
                ['<C-k>']     = function()
                    if ls.jumpable(-1) then
                        ls.jump(-1)
                    end
                end,
            },

            -- Global sources
            sources = {
                { name = 'nvim_lsp', keyword_length = 1 },
                -- { name = 'ultisnips', keyword_length = 2 }, -- For ultisnips users.
                { name = 'luasnip',  keyword_length = 2 }, -- For ultisnips users.
                { name = "lazydev",  group_index = 0 },
                {
                    name = 'spell',
                    keyword_length = 3,
                    option = {
                        keep_all_entries = false,
                        enable_in_context = function()
                            return require('cmp.config.context').in_treesitter_capture('spell')
                        end,
                    },
                },
                {
                    name = 'fuzzy_buffer',
                    keyword_length = 5,
                    option = {
                        -- This config use all opened buffers
                        get_bufnrs = function()
                            local bufs = {}
                            for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
                                local buftype = vim.api.nvim_get_option_value('buftype', { buf = bufnr })
                                if buftype ~= 'nofile' and buftype ~= 'prompt' then
                                    bufs[#bufs + 1] = bufnr
                                end
                            end
                            return bufs
                        end
                    },
                },
                {
                    name = 'fuzzy_path',
                    keyword_length = 1,
                },
            },

            formatting = {
                expandable_indicator = true,
                fields = { 'kind', 'abbr', 'menu' },
                format = lspkind.cmp_format({
                    mode = 'symbol', -- show only symbol annotations
                    maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
                    ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                    show_labelDetails = false, -- show labelDetails in menu. Disabled by default
                    menu = {
                        nvim_lsp     = " ",
                        luasnip      = "",
                        fuzzy_path   = "",
                        fuzzy_buffer = "",
                        spell        = "󰓆",
                        cmdline      = "",
                        orgmode      = "",
                    },
                })
            },

            sorting = {
                priority_weight = 2,
                comparators = {
                    require "cmp-under-comparator".under,
                    require('cmp_fuzzy_buffer.compare'),
                    compare.offset,
                    compare.exact,
                    compare.score,
                    compare.recently_used,
                    compare.kind,
                    compare.sort_text,
                    compare.length,
                    compare.order,
                },
            },

        })

        -- Lua
        cmp.setup.filetype({ 'lua' }, {
            sources = cmp.config.sources({
                { name = 'nvim_lsp', keyword_length = 1 },
                { name = 'luasnip',  keyword_length = 2 }, -- For ultisnips users.
                { name = "lazydev",  group_index = 1 },
                {
                    name = 'spell',
                    keyword_length = 3,
                    option = {
                        keep_all_entries = false,
                        enable_in_context = function()
                            return require('cmp.config.context').in_treesitter_capture('spell')
                        end,
                    },
                },
                {
                    name = 'fuzzy_buffer',
                    keyword_length = 5,
                    option = {
                        -- This config use all opened buffers
                        get_bufnrs = function()
                            local bufs = {}
                            for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
                                local buftype = vim.api.nvim_get_option_value('buftype', { buf = bufnr })
                                if buftype ~= 'nofile' and buftype ~= 'prompt' then
                                    bufs[#bufs + 1] = bufnr
                                end
                            end
                            return bufs
                        end
                    },
                },
                {
                    name = 'fuzzy_path',
                    keyword_length = 1,
                }
            })
        })

        -- Text
        cmp.setup.filetype({ 'markdown', 'org', 'txt', 'tex' }, {
            sources = cmp.config.sources({
                { name = 'git' }, -- You can specify the `cmp_git` source if you were installed it.
            }, {
                { name = 'nvim_lsp', keyword_length = 1 },
                { name = 'luasnip',  keyword_length = 2 }, -- For ultisnips users.
                {
                    name = 'spell',
                    keyword_length = 3,
                    option = {
                        keep_all_entries = false,
                        enable_in_context = function()
                            return require('cmp.config.context').in_treesitter_capture('spell')
                        end,
                    },
                },
                {
                    name = 'fuzzy_buffer',
                    keyword_length = 5,
                    option = {
                        -- This config use all opened buffers
                        get_bufnrs = function()
                            local bufs = {}
                            for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
                                local buftype = vim.api.nvim_get_option_value('buftype', { buf = bufnr })
                                if buftype ~= 'nofile' and buftype ~= 'prompt' then
                                    bufs[#bufs + 1] = bufnr
                                end
                            end
                            return bufs
                        end,
                    },
                },
                {
                    name = 'fuzzy_path',
                    keyword_length = 1,
                }
            })
        })

        -- Set configuration for git
        -- git
        cmp.setup.filetype({ 'gitcommit', 'gitignore' }, {
            sources = cmp.config.sources({
                { name = 'git' }, -- You can specify the `cmp_git` source if you were installed it.
            }, {
                {
                    name = 'spell',
                    keyword_length = 3,
                    option = {
                        keep_all_entries = false,
                        enable_in_context = function()
                            return require('cmp.config.context').in_treesitter_capture('spell')
                        end,
                    },
                },
                {
                    name = 'fuzzy_buffer',
                    keyword_length = 5,
                    option = {
                        -- This config use all opened buffers
                        get_bufnrs = function()
                            local bufs = {}
                            for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
                                local buftype = vim.api.nvim_get_option_value('buftype', { buf = bufnr })
                                if buftype ~= 'nofile' and buftype ~= 'prompt' then
                                    bufs[#bufs + 1] = bufnr
                                end
                            end
                            return bufs
                        end
                    },
                },
                {
                    name = 'fuzzy_path',
                    keyword_length = 1,
                },
            })
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                {
                    name = 'cmdline',
                    keyword_length = 2,
                },
                {
                    name = 'fuzzy_path',
                    keyword_length = 3,
                },
                -- {
                --   name = 'fuzzy_buffer',
                --   keyword_length = 3,
                -- },
            })
        })

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                {
                    name = 'fuzzy_buffer',
                    keyword_length = 1,
                },
            }
        })
    end,
}
