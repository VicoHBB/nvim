return {
  {
    'saghen/blink.compat',
    enabled = true,
    -- use the latest release, via version = '*', if you also use the latest release for blink.cmp
    version = '*',
    -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
    lazy = true,
    -- make sure to set opts so that lazy.nvim calls blink.compat's setup
    opts = {},
  },
  {
    'saghen/blink.cmp',
    enabled = true,
    event = {
      -- "VeryLazy",
      "InsertEnter",
      "CmdlineEnter"
    },
    -- optional: provides snippets for the snippet source
    dependencies = { },
    -- use a release tag to download pre-built binaries
    version = '*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- See the full "keymap" documentation for information on defining your own keymap.
      keymap = {
        ['<C-space>'] = {
          'show',
          'show_documentation',
          'hide_documentation'
        },

        ['<C-e>'] = { 'hide' },
        ['<C-y>'] = { 'select_and_accept' },
        ['<CR>'] = { 'select_and_accept', 'fallback' },

        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },

        ['<C-p>'] = { 'show','select_prev', 'fallback' },
        ['<C-n>'] = { 'show','select_next', 'fallback' },


        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },

        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

        ['<C-j>'] = { 'snippet_forward', 'fallback' },
        ['<C-k>'] = { 'snippet_backward', 'fallback' },

        -- Manage by noice
        -- ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },

      },

      cmdline = {
        keymap =
        {
          ['<C-e>'] = { 'hide' },
          ['<CR>'] = { 'select_and_accept', 'fallback' },
          ['<Tab>'] = { 'show', 'select_next', 'fallback' },
          ['<S-Tab>'] = { 'show', 'select_prev', 'fallback' },
          ['C-Space'] = { 'show_documentation', 'hide_documentation' }
        },
        completion = {
          ghost_text = {
            enabled = false
          },
        },
        -- sources = {
        --   'cmdline',
        --   'lazydev',
        --   'path',
        --   'buffer',
        -- }
      },


      signature = { -- This is manage by Noice
        enabled = false,
        window = {
          border = 'rounded',
        }
      },

      snippets = {
        preset = 'luasnip',
      },

      completion = {
        accept = {
          auto_brackets = {
            enabled = true
          },
        },
        menu = {
          enabled = true,
          min_width = 15,
          max_height = 10,
          border = 'rounded',
          winblend = 20,
          winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:None,CursorLine:BlinkCmpMenuSelection',
          scrolloff = 2,
          scrollbar = true,
          -- Which directions to show the window,
          -- falling back to the next direction when there's not enough space
          direction_priority = {
            's',
            'n'
          },
          -- nvim-cmp style menu
          draw = {
            columns = {
              { "kind_icon", "label", "label_description", gap = 1 },
              { "source_name" }
            },
            treesitter = {
              'lsp'
            },
          },
        },
        -- Show documentation when selecting a completion item
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
          update_delay_ms = 50,
          treesitter_highlighting = true,
          window = {
            border = 'rounded',
            winblend = 20,
            scrollbar = true,
            winhighlight = 'FloatBorder:None',
            direction_priority = {
              menu_north = { 'e', 's', 'n', 'w' },
              menu_south = { 'e', 's', 'n', 'w' },
            },
          }
        },
      },

      appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- Will be removed in a future release
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },


      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = {
          'lsp',
          'lazydev',
          'snippets',
          'path',
          'buffer',
        },
        per_filetype = {
          org = {
            'orgmode',
            'lsp',
            'lazydev',
            'snippets',
            'path',
            'buffer',
          },
          -- cmdline = {
          --   'cmdline',
          --   'lazydev',
          --   'path',
          --   'buffer',
          -- }
        },
        providers = {
          lsp = {
            name = " ",
            module = "blink.cmp.sources.lsp",
            score_offset = 100,
          },
          lazydev = {
            name = " ",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
          orgmode = {
            name = " ",
            module = "orgmode.org.autocompletion.blink",
            fallbacks = { 'buffer' },
            score_offset = 100,
          },
          snippets = {
            name = " ",
            module = "blink.cmp.sources.snippets",
            min_keyword_length = 2,
            score_offset = 50,
          },
          path = {
            name = " ",
            module = "blink.cmp.sources.path",
            min_keyword_length = 2,
          },
          buffer = {
            name = " ",
            module = "blink.cmp.sources.buffer",
            min_keyword_length = 1,
            score_offset = -10,
          },
          cmdline = {
            name = " ",
            module = "blink.cmp.sources.cmdline",
          },
        },
      },
    },
    opts_extend = { "sources.default" }
  }
}
