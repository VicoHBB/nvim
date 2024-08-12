return {
  "junegunn/fzf",
  dir = "~/.fzf",
  build = "./install --all",
  -- build = function()
  --     vim.fn['fzf#install']()
  -- end
}
