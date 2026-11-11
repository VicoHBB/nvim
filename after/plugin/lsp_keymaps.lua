local autocmd = vim.api.nvim_create_autocmd

autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp_keymaps", { clear = true }),
    callback = function(event)

        local client = vim.lsp.get_client_by_id(event.data.client_id)

        local keyset = function(mode, keys, func, desc)
            vim.keymap.set(
                mode,
                keys,
                func,
                {
                    silent = true,
                    buffer = event.buf,
                    desc = "LSP -> " .. desc
                }
            )
        end

        local keyset_expr = function(mode, keys, func, desc)
            vim.keymap.set(
                mode,
                keys,
                func,
                {
                    expr = true,
                    silent = true,
                    buffer = event.buf,
                    desc = "LSP -> " .. desc
                }
            )
        end

        local fzf      = require("fzf-lua")
        local goto_opts = { jump1 = true }

        keyset_expr( 'n', "<leader>R",
            function() return ":IncRename " .. vim.fn.expand("<cword>") end,
            "[R]ename"
        )

        keyset_expr( 'n', "grn",
            function() return ":IncRename " .. vim.fn.expand("<cword>") end,
            "[R]ename"
        )

        keyset({ 'n', 'x' }, "<leader>aa", function()
                fzf.lsp_code_actions()
            end,
            "Code [A]ction"
        )

        keyset({ 'n', 'x' }, "gra", function()
                fzf.lsp_code_actions()
            end,
            "Code [A]ction"
        )
        -- Move diag shortcut
        -- @TODO: jump()'s float = true is deprecated and will be removed soon (0.14); needs review.
        -- Replacement is on_jump (:h diagnostic-on-jump-example)
        keyset('n', "<leader>[",
            function()
                vim.diagnostic.jump({ count = -1, float = true })
            end,
            "Previous Dx"
        )
        keyset('n', "<leader>]",
            function()
                vim.diagnostic.jump({ count = 1, float = true })
            end,
            "Next Dx"
        )
        keyset('n', "[d",
            function()
                vim.diagnostic.jump({ count = -1, float = true })
            end,
            "Previous Dx"
        )
        keyset('n', "]d",
            function()
                vim.diagnostic.jump({ count = 1, float = true })
            end,
            "Next Dx"
        )
        keyset('n', '<leader>?', function()
                vim.diagnostic.setqflist()
            end
            ,
            "Show diagnostics in quickfix"
        )
        -- GoTo
        keyset("n", "gd", function()
                fzf.lsp_definitions(goto_opts)
            end,
            "[G]o to [D]efinitions"
        )
        keyset("n", "gD", function()
                fzf.lsp_declarations(goto_opts)
            end,
            "[G]o to [D]eclaration"
        )
        keyset("n", "grr", function()
                fzf.lsp_references(goto_opts)
            end,
            "[G]o to [R]eferences"
        )
        keyset("n", "grt", function()
                fzf.lsp_typedefs(goto_opts)
            end,
            "[G]o to [T]ype Definitions"
        )
        keyset("n", "gri", function()
                fzf.lsp_implementations(goto_opts)
            end,
            "[G]o to [I]mplementation"
        )
        keyset("n", "grf", function()
                fzf.lsp_finder() -- This is for see all
            end,
            "[G]o to [F]inder"
        )
        keyset("n", "grI", function()
                fzf.lsp_incoming_calls(goto_opts)
            end,
            "[G]o to [I]ncoming calls"
        )
        keyset("n", "grO", function()
                fzf.lsp_outgoing_calls(goto_opts)
            end,
            "[G]o to [O]utgoing calls"
        )
        keyset("n", "gO", function()
                fzf.lsp_document_symbols(goto_opts)
            end,
            "[G]o to [O]utline / Symbols"
        )
        keyset("n", "K", function()
                require("noice.lsp").hover()
            end,
            "Hover Documentation"
        )
        keyset("n", "gK", require("noice.lsp").signature,
            "Show Signature"
        )
        keyset_expr("n", "<c-f>", function()
                if not require("noice.lsp").scroll(4) then
                    return "<c-f>"
                end
            end,
            "Scroll hover down"
        )
        keyset_expr("n", "<c-b>", function()
                if not require("noice.lsp").scroll(-4) then
                    return "<c-b>"
                end
            end,
            "Scroll hover up"
        )
        -- @TODO: Evaluate conform.nvim for per-formatter control and format-on-save.
        if client and client:supports_method("textDocument/rangeFormatting", event.buf) then
            keyset('x', 'gq', function()
                    vim.notify("Formatting with LSP...", vim.log.levels.INFO)
                    vim.lsp.buf.format { async = false }
                end,
                "Format selection (LSP)"
            )
        else
            keyset('x', 'gq', function()
                    vim.notify("Formatting with native gq...", vim.log.levels.INFO)
                    vim.cmd("normal! gq")
                end,
                "Format selection (native gq)"
            )
        end
        -- Navbuddy
        keyset('n', "<leader>n", require('nvim-navbuddy').open,
            "Navigate through symbols"
        )
        -- LSP clients
        keyset('n', '<leader>Ls', function()
                vim.cmd("LspStart")
            end,
            "Start LSP servers for this filetype"
        )
        keyset('n', '<leader>Lk', function()
                vim.cmd("LspStop")
            end,
            "Stop (disable) LSP servers attached to this buffer"
        )
        keyset('n', '<leader>Lr', function()
                vim.cmd("LspRestart")
            end,
            "Restart all active LSP servers"
        )
        keyset('n', '<leader>Li', function()
                vim.cmd("LspInfo")
            end,
            "LSP info (:checkhealth vim.lsp)"
        )
    end,
})
