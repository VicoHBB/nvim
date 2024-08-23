return {
  -- [[ CMP ]
  "hrsh7th/nvim-cmp",
  event = "VeryLazy",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-cmdline",
    "onsails/lspkind-nvim",
    -- "dmitmel/cmp-cmdline-history",
    {
      "kdheepak/cmp-latex-symbols",
      ft = { "tex", "org" },
    },
    "f3fora/cmp-spell",
    "lukas-reineke/cmp-under-comparator",
    {
      'tzachar/cmp-fuzzy-buffer',
      requires = {
        'tzachar/fuzzy.nvim',
      },
    },
    {
      'tzachar/cmp-fuzzy-path',
      dependencies = {
        'tzachar/fuzzy.nvim',
      },
    },
    "honza/vim-snippets", -- Snippets
    "SirVer/ultisnips",   -- Ultisnips
    "quangnguyen30192/cmp-nvim-ultisnips",
  },
  config = function()
    local cmp     = require('cmp')                -- Set up nvim-cmp
    local lspkind = require('lspkind')            -- Pretty Printing Menu Items
    local compare = require('cmp.config.compare') -- Sorting
    local select_opts = {behavior = cmp.SelectBehavior.Select}

    -- UltiSnips
    require("cmp_nvim_ultisnips").setup {}

    cmp.setup({

      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
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
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
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

      },

      sources = {
        { name = 'nvim_lsp',  keyword_length = 1 },
        { name = 'ultisnips', keyword_length = 2 }, -- For ultisnips users.
        { name = "orgmode" },
        {
          name = "latex_symbols",
          option = {
            strategy = 0, -- mixed
          },
        },
        {
          name = 'spell',
          keyword_length = 2,
          option = {
            keep_all_entries = false,
            enable_in_context = function()
              return require('cmp.config.context').in_treesitter_capture('spell')
            end,
          },
        },
        {
          name = 'fuzzy_buffer',
          keyword_length = 3,
          option = {
            -- This config use all opened buffers
            get_bufnrs = function()
              local bufs = {}
              for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                local buftype = vim.api.nvim_buf_get_option(buf, 'buftype')
                if buftype ~= 'nofile' and buftype ~= 'prompt' then
                  bufs[#bufs + 1] = buf
                end
              end
              return bufs
            end
          },
        },
        { name = 'fuzzy_path', keyword_length = 1 },
      },

      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol',           -- show only symbol annotations
          maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
          ellipsis_char = '...',     -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
          show_labelDetails = false, -- show labelDetails in menu. Disabled by default
          menu = {
            fuzzy_buffer    = "󰦨",
            nvim_lsp        = "[LSP]",
            fuzzy_path      = "",
            spell           = "󰓆",
            cmdline         = "",
            -- cmdline_history = "",
            orgmode         = "",
            latex_symbols   = "",
          },
          -- menu = source_mapping,
          -- The function below will be called before any actual modifications from lspkind
          -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
          -- before = function (entry, vim_item)
          --   return vim_item
          -- end
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

    -- Set configuration for specific filetype.
    -- git
    cmp.setup.filetype({ 'gitcommit', 'gitignore' }, {
      sources = cmp.config.sources({
        { name = 'git' }, -- You can specify the `cmp_git` source if you were installed it.
      }, {
        { name = 'fuzzy_buffer' },
        { name = 'fuzzy_path' }
      })
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'fuzzy_path' }
      }, {
        { name = 'cmdline' },
        {
          -- name = 'cmdline_history',
          keyword_length = 3,
        },
      })
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'fuzzy_buffer' },
      }
    })
  end,
}
