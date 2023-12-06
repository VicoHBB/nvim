return {
  'neovim/nvim-lspconfig',                                        -- Config
  dependencies = {
    "williamboman/mason.nvim",
    "folke/neodev.nvim"
  },
  priority = 1000,
  config = function()

    local on_attach = function (_, bufnr)
      vim.keymap.set( "n", "K", "<CMD>Lspsaga hover_doc<CR>", {desc = "Hover", silent = true, buffer=bufnr})
      vim.keymap.set("n", "gK", require("hover").hover, {desc = "Hover different sources", silent = true, buffer=bufnr} )
      vim.keymap.set(
        { "i" },
        '<C-k>',
        function()
          require('lsp_signature').toggle_float_win()
        end,
        {
          silent = true,
          noremap = true,
          desc = 'toggle signature',
        }
      )
      -- vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)", silent = true, buffer=bufnr} )
    end

    -- Set up cmp.
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    require('lspconfig').clangd.setup{
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes    = { "c", "cpp" },
    }

    -- require('lspconfig').ccls.setup {
    --   init_options = {
    --     compilationDatabaseDirectory = "build";
    --     index = {
    --       threads = 0;
    --     };
    --     clang = {
    --       excludeArgs = { "-frounding-math"} ;
    --     };
    --   }
    -- }

    require('lspconfig').cmake.setup{
      on_attach = on_attach,
      root_dir = require('lspconfig').util.root_pattern(
        'CMakePresets.json',
        'CTestConfig.cmake',
        '.git',
        'build',
        'cmake',
        'compile_commands.json'
      )
    }

    require('lspconfig').neocmake.setup{
      on_attach = on_attach,
      root_dir = require('lspconfig').util.root_pattern(
        '.git',
        'cmake',
        'compile_commands.json'
      ),
    }

    require('lspconfig').pyright.setup{
      on_attach = on_attach,
      capabilities = capabilities,
    }

    require('lspconfig').pylsp.setup{
      on_attach = on_attach,
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

    -- To support org files
    vim.cmd [[
      autocmd BufRead,BufNewFile *.org set filetype=org
    ]]

    require('lspconfig').ltex.setup{
      on_attach = on_attach,
      settings = {
        ltex = {
          -- language = "en-US",
          language = "es",
          dictionary = {
            ['en-GB'] = {
              "MicroPython",
              "AUTOSAR",
            },
            ['es'] = {
              "MicroPython",
              "AUTOSAR",
            },
          },
        },
      },
    }

    require('lspconfig').marksman.setup{
      on_attach = on_attach,
      cmd = { "marksman", "server" },
      capabilities = capabilities,
    }

    -- require('lspconfig').grammarly.setup{
    -- 	filetypes = {"markdown"}
    -- }

    require('lspconfig').asm_lsp.setup{
      on_attach = on_attach,
      capabilities = capabilities,
    }

    require('lspconfig').svlangserver.setup{
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "vhdl", "verilog", "systemverilog"  },
      root_dir = require('lspconfig').util.root_pattern(
        '.git',
        '.gitignore',
        '.svlint.toml',
        '.svls.toml',
        'rtl'
      )
    }

    require('lspconfig').svls.setup{
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "svls", "-d" },
      filetypes = { "vhdl", "verilog", "systemverilog"  },
      root_dir = require('lspconfig').util.root_pattern(
        '.git',
        '.gitignore',
        '.svlint.toml',
        '.svls.toml',
        'rtl'
      )
    }

    require('lspconfig').vimls.setup{
      on_attach = on_attach,
      cmd = { "vim-language-server", "--stdio" },
      filetypes = { "vim" }
    }

    require('lspconfig').lua_ls.setup {
      on_attach = on_attach,
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

  end,
}
