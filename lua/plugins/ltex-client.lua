return {
  {
    "icewind/ltex-client.nvim",
    ft = { "tex", "bib", "markdown", "org" },
    config = function()
      require("ltex-client").setup()
    end
  },
}
