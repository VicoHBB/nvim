return {
  'lukas-reineke/headlines.nvim',
  dependencies = {
    "nvim-treesitter/nvim-treesitter"
  },
  ft = {
    "markdown",
    "org",
    "neorg",
  },
  opts = {
    vim.cmd [[highlight Headline guibg=#3C3836]],
    vim.cmd [[highlight CodeBlock guibg=#282828]],
    vim.cmd [[highlight Dash guibg=#3C3836]],
    vim.cmd [[highlight Quote guibg=#282828]],
    markdown = {
      headline_highlights = { "Headline" },
      codeblock_highlight = "CodeBlock",
      dash_highlight = "Dash",
      dash_string = "-",
      quote_highlight = "Quote",
      quote_string = "┃",
      fat_headlines = false,
    },
    org = {
      headline_highlights = { "Headline" },
      codeblock_highlight = "CodeBlock",
      dash_highlight = "Dash",
      dash_string = "-",
      quote_highlight = "Quote",
      quote_string = "┃",
      fat_headlines = false,
    }
  }
}
