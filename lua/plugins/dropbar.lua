return {
    'Bekaboo/dropbar.nvim',
    enabled = true,
    dependencies = {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
    },
    config = function()
        local dropbar_api = require('dropbar.api')
        local sources = require('dropbar.sources')
        local utils = require('dropbar.utils')

        require('dropbar').setup({
            sources = {
                terminal = {
                    name = function(_buf)
                        return '' -- No path
                    end,
                    icon = function(_buf)
                        return ' '
                    end,
                },
            },
            bar = {
                sources = function(buf, _)
                    if vim.bo[buf].ft == 'markdown' then
                        return { sources.path, sources.markdown }
                    end

                    if vim.bo[buf].buftype == 'terminal' then
                        return { sources.terminal } -- Add custom source
                    end

                    if vim.bo[buf].ft == 'OverseerList'then
                        return {
                            {
                                get_symbols = function(_, _, _)
                                    local bar = require('dropbar.bar')
                                    return {
                                        bar.dropbar_symbol_t:new({
                                            icon = " ",
                                            icon_hl = 'DropBarIconKindTerminal',
                                            name = '',
                                            name_hl = 'DropBarKindTerminal',
                                        }),
                                    }
                                end,
                            },
                        }
                    end

                    if vim.bo[buf].buftype == 'nofile' then
                        return {} -- Add custom source
                    end

                    return {
                        sources.path,
                        utils.source.fallback({
                            sources.lsp,
                            sources.treesitter,
                        }),
                    }
                end,
            },
        })

        vim.keymap.set('n', '<Leader>p', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
    end,
}
