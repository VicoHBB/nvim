return {
  "rolv-apneseth/tfm.nvim",
  enabled = true,
  lazy = false, -- Recommended
  opts = {
    -- TFM to use
    -- Possible choices: "ranger" | "nnn" | "lf" | "vifm" | "yazi" (default)
    file_manager = "yazi",
    -- Replace netrw entirely
    -- Default: false
    replace_netrw = false,
    -- Enable creation of commands
    -- Default: false
    -- Commands:
    --   Tfm: selected file(s) will be opened in the current window
    --   TfmSplit: selected file(s) will be opened in a horizontal split
    --   TfmVsplit: selected file(s) will be opened in a vertical split
    --   TfmTabedit: selected file(s) will be opened in a new tab page
    enable_cmds = true,
    -- Custom keybindings only applied within the TFM buffer
    -- Default: {}
    keybindings = {
      ["<ESC>"] = "q",
      -- Override the open mode (i.e. vertical/horizontal split, new tab)
      -- Tip: you can add an extra `<CR>` to the end of these to immediately open the selected file(s) (assuming the TFM uses `enter` to finalise selection)
      ["<C-v>"] = "<C-\\><C-O>:lua require('tfm').set_next_open_mode(require('tfm').OPEN_MODE.vsplit)<CR><CR>",
      ["<C-x>"] = "<C-\\><C-O>:lua require('tfm').set_next_open_mode(require('tfm').OPEN_MODE.split)<CR><CR>",
      ["<C-t>"] = "<C-\\><C-O>:lua require('tfm').set_next_open_mode(require('tfm').OPEN_MODE.tabedit)<CR><CR>",
    },
    -- Customise UI. The below options are the default
    ui = {
      border = "rounded",
      height = 0.8,
      width  = 0.8,
      x      = 0.5,
      y      = 0.5,
    },
  },
  keys = {
    {
      "<leader>F",
      function()
        require("tfm").select_file_manager("yazi")
        require("tfm").open()
      end,
      mode = { 'n' },
      silent = true,
      desc = "Open Yazi",
    },
    {
      "<leader>fV",
      function()
        require("tfm").select_file_manager("vifm")
        require("tfm").open()
      end,
      mode = { 'n' },
      silent = true,
      desc = "Open ViFm",
    },
  },
}
