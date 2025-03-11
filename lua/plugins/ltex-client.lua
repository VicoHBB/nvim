return {
  {
    "icewind/ltex-client.nvim",
    enabled = false,
    ft = { "tex", "bib", "markdown", "org" },
    config = function()
      require("ltex-client").setup()
    end
  },
}
