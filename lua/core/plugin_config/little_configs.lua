
-- Vim-rooter
vim.g.rooter_patterns = { '.git', 'makefile', 'CMakeLists.txt' }
vim.g.rooter_change_directory_for_non_project_files = 'current'

-- Vim-screenshoot
vim.g.vimShotSavePath = "Pictures/code-screenshots"

vim.g.SuperTabDefaultCompletionType = 'context'

-- Asyncrun
vim.g.asyncrun_open = 8


-- Ranger
vim.g.NERDTreeHijackNetrw  = 1  -- add this line if you use NERDTree
vim.g.ranger_replace_netrw = 1  -- open ranger when vim open a directory
