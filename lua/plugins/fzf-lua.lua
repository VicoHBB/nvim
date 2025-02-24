
return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  -- optional for icon support
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  -- "echasnovski/mini.icons",
  },
  opts = function (_, opts)
    local fzf = require('fzf-lua')
    local config = fzf.config
    local actions = fzf.actions
    local keyset = vim.keymap.set

    local default_actions = {
      ["enter"]  = actions.file_edit,
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
      height   = 0.40,
      width    = 0.60,
      preview = {
        layout = "vertical",
        vertical = "down:75%",
        hidden = true,
      }
    }

    local winopts_nvim_default = {
      height   = 0.40,
      width    = 0.60,
      preview = {
        layout = "vertical",
        vertical = "down:75%",
        hidden = true,
      }
    }

    -- [[ winoptes ]]

    -- All win
    config.defaults.winopts.height    = 0.85
    config.defaults.winopts.width     = 0.80
    config.defaults.winopts.row       = 0.50
    config.defaults.winopts.col       = 0.50

    --  Preview
    config.defaults.winopts.preview.vertical       = "down:45%"
    config.defaults.winopts.preview.horizontal     = "right:60%"
    config.defaults.winopts.preview.winopts.number = true
    config.defaults.winopts.preview.winopts.wrap   = true

    config.defaults.winopts.on_create = function ()
      keyset({ "t", 'i' }, "<C-j>", "<Down>", { silent = true, buffer = true })
      keyset({ "t", "i" }, "<C-k>", "<Up>", { silent = true, buffer = true })
    end

    -- [[ keymaps ]]

    -- builtin
    config.defaults.keymap.builtin["<c-f>"] = "preview-down"
    config.defaults.keymap.builtin["<c-b>"] = "preview-up"
    config.defaults.keymap.builtin["<c-u>"] = "preview-page-up"
    config.defaults.keymap.builtin["<c-d>"] = "preview-page-down"
    config.defaults.keymap.builtin["<c-h>"] = "toggle-preview"
    config.defaults.keymap.builtin["<a-m>"] = "toggle-fullscreen"
    config.defaults.keymap.builtin["<c-l>"] = "toggle-preview-ccw"
    config.defaults.keymap.builtin["<a-l>"] = "toggle-preview-cw"
    config.defaults.keymap.builtin["<c-w>"]  = "toggle-preview-wrap"

    -- fzf
    config.defaults.keymap.fzf["ctrl-f"] = "preview-down"
    config.defaults.keymap.fzf["ctrl-b"] = "preview-up"
    config.defaults.keymap.fzf["ctrl-u"] = "preview-page-up"
    config.defaults.keymap.fzf["ctrl-d"] = "preview-page-down"
    config.defaults.keymap.fzf["ctrl-h"] = "toggle-preview"
    config.defaults.keymap.fzf["ctrl-w"] = "toggle-preview-wrap"

    -- [[ actions ]]
    config.defaults.actions.files = default_actions

    -- [[ Pickers ]]

    -- Files
    config.defaults.files.winopts = winopts_files_default
    -- Old Files
    config.defaults.oldfiles.winopts = winopts_files_default
    -- Git Files
    config.defaults.git.icons = {
      ["M"] = { icon = "★", color = "red" },
      ["D"] = { icon = "✗", color = "red" },
      ["A"] = { icon = "+", color = "green" },
    }
    config.defaults.git.files.winopts = winopts_files_default

    config.defaults.builtin.winopts = winopts_files_default

    config.defaults.blines.winopts = {
      layout = "vertical",
      preview = {
        hidden = true,
      }
    }

    config.defaults.registers.winopts = {
      layout = "vertical",
      preview = {
        hidden = true,
      }
    }

    -- Neovim Pickers
    -- config.defaults.commands.winopts         = winopts_nvim_default
    -- config.defaults.commands_history.winopts = winopts_nvim_default

    -- LSP
    config.defaults.lsp.winopts = {
      relative = "cursor",
      height   = 0.40,
      width    = 0.50,
      preview = {
        layout = "flex",
        vertical = "down:75%",
        hidden = true,
      }
    }
    -- Code Actions
    config.defaults.lsp.code_actions.winopts = {
      relative = "cursor",
      row      = 1,
      col      = 0,
      height   = 0.30,
      width    = 0.40,
      preview = {
        layout         = "flex",
        wrap           = true,    -- preview line wrap (fzf's 'wrap|nowrap')
        vertical       = "down:75%",
        horizontal     = "right:75%",
        hidden         = true,
        winopts = {
          number = true
        }
      }
    }

    -- Spell Suggest
    config.defaults.spell_suggest.winopts = {
      relative = "cursor",
      row      = 1,
      col      = 0,
      height   = 0.25,
      width    = 0.25,
    }

  end
}
