return {
  "nvim-lualine/lualine.nvim",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('lualine').setup({
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = {
          'mode',
          require("recorder").displaySlots,
          require("recorder").recordingStatus,
        },
        lualine_b = { 'branch', 'diff' },
        lualine_c = {
          {
            'filename',
            file_status = true,    -- Displays file status (readonly status, modified status)
            newfile_status = true, -- Display new file status (new file means no write after created)
            path = 1,              -- 1: Relative path
            shorting_target = 40,  -- Shortens path to leave 40 spaces in the window
            -- for other components. (terrible name, any suggestions?)
            symbols = {
              modified = ' ', -- Text to show when the file is modified.
              readonly = ' ', -- Text to show when the file is non-modifiable or readonly.
              unnamed = '{}', -- Text to show for unnamed buffers.
              newfile = ' ', -- Text to show for new created file before first writting
            },
          },
        },
        lualine_x = {
          'tabnine',
          'encoding',
          'tfiletype'
        },
        lualine_y = {
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
          },
          {
            'diagnostics',
            -- Table of diagnostic sources, available sources are:
            --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
            -- or a function that returns a table as such:
            --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
            sources = { 'nvim_diagnostic', 'nvim_lsp' },
            -- Displays diagnostics for the defined severity types
            sections = { 'error', 'warn', 'info', 'hint' },
            -- diagnostics_color = {
            -- Same values as the general color option can be used here.
            --   error = 'DiagnosticError', -- Changes diagnostics' error color.
            --   warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
            --   info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
            --   hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
            -- },
            symbols = {
              error = " ",
              warn = " ",
              hint = "󰌶 ",
              hnfo = " ",
            },
            colored = true,           -- Displays diagnostics status in color if set to true.
            update_in_insert = false, -- Update diagnostics in insert mode.
            always_visible = false,   -- Show diagnostics even if there are none.
          },
        },
        lualine_z = {
          -- 'progress',
          '%c',
          '%l/%L',
          {
            'fileformat',
            symbols = {
              unix = ' ', -- e712
              dos = '', -- e70f
              mac = '', -- e711
            },
          },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            'filename',
            file_status = true,  -- Displays file status (readonly status, modified status)
            newfile_status = true, -- Display new file status (new file means no write after created)
            path = 1,            -- 1: Relative path
            shorting_target = 50, -- Shortens path to leave 40 spaces in the window
            -- for other components. (terrible name, any suggestions?)
            symbols = {
              modified = ' ', -- Text to show when the file is modified.
              readonly = ' ', -- Text to show when the file is non-modifiable or readonly.
              unnamed = '{}', -- Text to show for unnamed buffers.
              newfile = ' ', -- Text to show for new created file before first writting
            },
          }
        },
        lualine_x = {
          '%c',
          '%l/%L',
        },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {
        'fzf',
        'lazy',
        'mason',
        'nvim-tree',
        'oil',
        'overseer',
        'quickfix',
        'symbols-outline',
        'toggleterm',
      }
    })
  end,
}
