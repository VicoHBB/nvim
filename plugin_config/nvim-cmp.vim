lua << EOF

-- Set up nvim-cmp.
local cmp = require('cmp')
-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Tabnine
local tabnine = require('cmp_tabnine.config')
-- Pretty Printing Menu Items
local lspkind = require('lspkind')
-- UltiSnips
require("cmp_nvim_ultisnips").setup{}

-- mapping
local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	cmp_tabnine = "[TN]",
	path = "[Path]",
}

cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
         vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    window = { 
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-6),
        ['<C-f>'] = cmp.mapping.scroll_docs(6),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    }),

    sources = cmp.config.sources({ 
        { name = 'cmp_tabnine' },
        { name = 'nvim_lsp' },
        --{ name = "neorg" },
        { name = "orgmode" },
        { name = 'calc' },
        -- { name = "rg" },
        { name = "latex_symbols" },
        { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'snippy' }, -- For snippy users.
        {
            name = 'spell',
            option = {
                keep_all_entries = false,
                enable_in_context = function()
                    return true
                end,
            },
        },
    }, {
      --{ name = 'buffer' },
      { name = 'fuzzy_buffer' },
      -- { name = 'fuzzy_path'},
    }),


    formatting = {
        format = function(entry, vim_item)
          -- if you have lspkind installed, you can use it like
          -- in the following line:
          vim_item.kind = lspkind.symbolic(vim_item.kind, {mode = "symbol"})
          vim_item.menu = source_mapping[entry.source.name]
          if entry.source.name == "cmp_tabnine" then
            local detail = (entry.completion_item.data or {}).detail
            vim_item.kind = ""
            if detail and detail:find('.*%%.*') then
              vim_item.kind = vim_item.kind .. ' ' .. detail
            end

            if (entry.completion_item.data or {}).multiline then
              vim_item.kind = vim_item.kind .. ' ' .. '[ML]'
            end
          end
          local maxwidth = 80
          vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
          return vim_item
        end,
    },

})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
      { name = 'fuzzy_buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' },
      { name = 'fuzzy_buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' },
      { name = 'fuzzy_path'},
    }, {
      { name = 'cmdline' },
      { name = 'cmdline_history' },
    })
})

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
-- capabilities = capabilities
-- }
    
--Tabnine
tabnine.setup({
    max_lines = 1000,
    max_num_results = 20,
    sort = true,
    run_on_every_keystroke = true,
    snippet_placeholder = '..',
    ignored_file_types = { 
      norg = true,
      neorg = true,
    -- default is not to ignore
    -- uncomment to ignore in lua:
    -- lua = true
    },
    show_prediction_strength = true,
    -- entry.completion_item.data.detail.multiline = true, -- chechk this
})


EOF
