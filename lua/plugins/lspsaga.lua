return {
  "glepnir/lspsaga.nvim",
  event = "LspAttach",
  dependencies = {
    {
      --Please make sure you install markdown and markdown_inline parser
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    }
  },
  config = function()
    -- require("lspsaga").init_lsp_saga{
    --     error_sign = '',
    --     warn_sign = '',
    --     hint_sign = '',
    --     infor_sign = '',
    -- }
    require("lspsaga").setup({
      ui = {
        -- This option only works in Neovim 0.9
        title = true,
        -- Border type can be single, double, rounded, solid, shadow.
        border = "double",
        winblend = 0,
        expand = "",
        collapse = "",
        code_action = "",
        incoming = " ",
        outgoing = " ",
        hover = ' ',
        kind = {},
      },
      symbol_in_winbar = {
        enable = true,
        separator = " ",
        ignore_patterns = {},
        hide_keyword = true,
        show_file = true,
        folder_level = 2,
        respect_root = false,
        color_mode = true,
      },
      code_action = {
        num_shortcut = true,
        show_server_name = true,
        extend_gitsigns = true,
      },
      outline = {
        auto_preview = false,
        auto_close = true,
      },
    })
  end,
}
