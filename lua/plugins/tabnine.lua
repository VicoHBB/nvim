return {
  'codota/tabnine-nvim',
  build = "./dl_binaries.sh",
  event = "VeryLazy",
  config = function()
    require('tabnine').setup({
      disable_auto_comment = true,
      accept_keymap = "<C-l>",
      dismiss_keymap = "<C-h>",
      debounce_ms = 800,
      suggestion_color = { gui = "#808080", cterm = 244 },
      exclude_filetypes = { "TelescopePrompt", "NvimTree" },
      -- absolute path to Tabnine log file
      log_file_path = os.getenv("HOME") .. "/.cache/nvim/tabnine",
      ignore_certificate_errors = false,
    })
  end
}
