" lua require'nvim_lsp'.ocamllsp.setup{on_attach=require'virtualtypes'.on_attach}

lua << EOF

-- local null_ls = require("null-ls")    -- null
local util = require("formatter.util")

require("lsp_signature").setup({})

-- require('virtualtypes').on_attach

require("mason").setup({
    ui = {
       -- Whether to automatically check for new versions when opening the :Mason window.
        check_outdated_packages_on_open = true,

        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        border = "double",

        -- Width of the window. Accepts:
        -- - Integer greater than 1 for fixed width.
        -- - Float in the range of 0-1 for a percentage of screen width.
        width = 0.8require'lspconfig'.cmake.setup{},

        -- Height of the window. Accepts:
        -- - Integer greater than 1 for fixed height.
        -- - Float in the range of 0-1 for a percentage of screen height.
        height = 0.9,

        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
  ensure_installed = { "clangd" },
  automatic_installation = false,
}) 

require('nvim-custom-diagnostic-highlight').setup({
	register_handler = true,                                    -- Wether to register the handler automatically
  handler_name = 'kasama/nvim-custom-diagnostic-highlight',   -- The name of the handler to be registered (has no effect if register_handler = false)
  highlight_group = 'Conceal',                                -- The Highlight group to set at the diagnostic
  patterns_override = {                                       -- Lua patterns to be tested against the diagnostic message. Overrides default behavior
    '%sunused', '^unused', 'not used', 'never used',
    'not read', 'never read', 'empty block', 'not accessed'
  },
  extra_patterns = {},                                        -- Extra lua patterns to add. Does NOT override and will be added to the above
  diagnostic_handler_namespace = 'unused_hl_ns',              -- Name of the handler namespace that will contain the highlight (needs to be unique)
  defer_until_n_lines_away = false,                           -- If set to a number, then highlighting is deferred until the cursor is N lines away from
                                                              -- diagnostics. Useful to avoid unwanted highlights in the currently edited position.
  defer_highlight_update_events = {'CursorHold', 'CursorHoldI'}, -- Events on which deferred highlights will be updated (passed to nvim_create_autocmd)
})

require('lspconfig').clangd.setup{
  capabilities = capabilities,
  filetypes    = { "c", "cpp" },
}

require('lspconfig').cmake.setup{
}

--require'lspconfig'.ccls.setup{}
-- require('lspconfig').pyright.setup{
--   capabilities = capabilities,
-- }
require('lspconfig').pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          --ignore = {'W391'},
          maxLineLength = 80
        }
      }
    }
  }
}
require('lspconfig').texlab.setup{
  capabilities = capabilities,
  filetypes    = { "tex", "plaintex", "bib" },
}

require('lspconfig').ltex.setup{
  settings = {
		ltex = {
			language = "en-US",
			-- language = "es",
      dictionary = {
        ['en-GB'] = { "MicroPython" },
        ['es'] = { "MicroPython" },
      },
		},
	},
}

require('lspconfig').marksman.setup{
	cmd = { "marksman", "server" },
  capabilities = capabilities,
}

-- require'lspconfig'.grammarly.setup{
-- 	filetypes = {"markdown"}
-- }

require('lspconfig').asm_lsp.setup{
  capabilities = capabilities,
}

require('lspconfig').svlangserver.setup{
  capabilities = capabilities,
  filetypes = { "vhdl", "verilog", "systemverilog", "verilog_systemverilog" },
}

require('lspconfig').svls.setup{
  capabilities = capabilities,
  cmd = { "svls", "-d" },
  filetypes = { "vhdl", "verilog", "systemverilog", "verilog_systemverilog" },
}

require('lspconfig').vimls.setup{
  cmd = { "vim-language-server", "--stdio" },
  filetypes = { "vim" }
}

require('lspconfig').lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but 
      -- unique identifier
      telemetry = {
        enable = true,
      },
    },
  },
}

-- require'lspconfig'.grammarly.setup{
--   filetypes    = { "markdown", "tex" },
-- }

require('lspconfig')['rust_analyzer'].setup{
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
  -- Server-specific settings...
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importEnforceGranularity = true,
        importPrefix = "crate"
        },
      cargo = {
        allFeatures = true
        },
      checkOnSave = {
        -- default: `cargo check`
        command = "cargo check"
        },
      inlayHints = {
        lifetimeElisionHints = {
          enable = true,
          useParameterNames = true
        },
      },
    }
  }
}

-- linter
require('lint').linters_by_ft = {
 -- markdown = {'vale',}
  -- c = { cpplint, cppcheck,}
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})


-- Formatter
-- Utilities for creating configurations
local util = require "formatter.util"
-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    lua = {
      -- "formatter.filetypes.lua" defines default configurations for the
      -- "lua" filetype
      require("formatter.filetypes.lua").stylua,

      -- You can also define your own configuration
      function()
        -- Supports conditional formatting
        if util.get_current_buffer_file_name() == "special.lua" then
          return nil
        end

        -- Full specification of configurations is down below and in Vim help
        -- files
        return {
          exe = "stylua",
          args = {
            "--search-parent-directories",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--",
            "-",
          },
          stdin = true,
        }
      end
    },

    -- c = {
    --   require("formatter.filetypes.c").clang_format,
    --     -- You can also define your own configuration
    --   function()
    --     -- Full specification of configurations is down below and in Vim help
    --     -- files
    --     return {
    --       exe = "clang-format",
    --       args = {
    --         -- "--search-parent-directories",
    --         -- "--stdin-filepath",
    --         -- util.escape_path(util.get_current_buffer_file_path()),
    --         -- "--",
    --         -- "-",
    --       },
    --       -- stdin = true,
    --     }
    --   end
    --  },

    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace
    },
  }
}

require("lspsaga").setup({
  ui = {
    -- This option only works in Neovim 0.9
    title = true,
    -- Border type can be single, double, rounded, solid, shadow.
    border = "double",
    winblend = 0,
    expand = "",
    collapse = "",
    code_action = "💡",
    incoming = " ",
    outgoing = " ",
    hover = ' ',
    kind = {},
  },
  symbol_in_winbar = {
    enable = true,
    separator = " ",
    ignore_patterns={},
    hide_keyword = true,
    show_file = true,
    folder_level = 2,
    respect_root = false,
    color_mode = true,
  },
})          -- lspsaga

EOF
