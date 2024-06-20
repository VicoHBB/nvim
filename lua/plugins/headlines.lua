return {
  'lukas-reineke/headlines.nvim',
  dependencies = {
    "nvim-treesitter/nvim-treesitter"
  },
  ft = {
    "markdown",
    "org"
  },
  opts = {
    vim.cmd [[highlight Dash guibg=#1d2021 guifg=#83a598 gui=bold]],
    -- vim.cmd [[highlight Dash_org guibg=#1d2021 guifg=#b8bb26 gui=bold]],
    markdown = {
      bullets = { "◉", "○", "✸", "✿" },
      codeblock_highlight = "CodeBlock",
      dash_highlight = "Dash",
      dash_string = "",
      quote_highlight = "Quote",
      quote_string = "┃",
      fat_headlines = false,
      fat_headline_upper_string = "▃",
      fat_headline_lower_string = "🬂",
    },
    org = {
      bullets = { "◉", "○", "✸", "✿" },
      codeblock_highlight = "CodeBlock",
      dash_highlight = "Dash",
      dash_string = "",
      quote_highlight = "Quote",
      quote_string = "┃",
      fat_headlines = false,
      fat_headline_upper_string = "▃",
      fat_headline_lower_string = "🬂",
    },
  }
}
