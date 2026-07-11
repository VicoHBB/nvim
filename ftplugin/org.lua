-- ============================================================================
-- Buffer variables
-- ============================================================================
-- opt_local, not opt: the global form leaked conceallevel=2 to every window
-- opened afterwards (global_settings sets 1). Shared prose options live in
-- the prose-like FileType autocmd of core/autocmds.lua
vim.opt_local.conceallevel  = 2
vim.opt_local.concealcursor = 'nc'
