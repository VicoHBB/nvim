-- ============================================================================
-- Local variables
-- ============================================================================
local keyset = vim.keymap.set
-- local executed_once  = false -- Flag to see the state of the command

-- ============================================================================
-- Buffer variables
-- ============================================================================

vim.o.syntax="enable"

vim.bo.tabstop     = 4
vim.bo.softtabstop = 4
vim.bo.expandtab   = true
vim.bo.shiftwidth  = 4
vim.wo.colorcolumn = "80"

-- ============================================================================
-- Autocommands
-- ============================================================================
-- @TODO: Review workflow with this
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'verilog', 'systemverilog' },
  callback = function()
    vim.cmd('VerilogErrorFormat Verilator 1')
  end,
  once = true,
})

-- -- To probe
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = { 'verilog', 'systemverilog' },
--   callback = function()
--     if not executed_once then
--       vim.cmd('VerilogErrorFormat Verilator 1')
--       executed_once = true
--     end
--   end
-- })

-- ============================================================================
-- Keymaps
-- ============================================================================

-- Compilation & Simulation

keyset('n', "<F1>", function()
  print([[
  Compilation & Simulation:
    <F1> -> (make help) Show this info
    <F8> -> (make clean) Clean project
    <F9> -> (make all) Build project
    <F10> -> (make run) Run simulation
    <F11> -> (make synth) Synthesize project"
    <F12> -> (make qrtl) Synthesize and view RTL
    <leader> ->vq (make view) View RTL schematic diagram
    <leader> ->vy (make ys) View simple RTL diagram with Yosys
  ]])
end
, {
  silent = true,
  desc = "Make help",
})


keyset('n', "<F8>", "<CMD>OverseerRunCmd make clean<CR>", {
  silent = true,
  desc = "Clean project",
})

keyset('n', "<F9>", ":OverseerRunCmd make all<CR>", {
  silent = true,
  desc = "Build project",
})

keyset('n', "<F10>", ":OverseerRunCmd make run<CR>", {
  silent = true,
  desc = "Run simulation",
})

keyset('n', "<F11>", "<CMD>OverseerRunCmd make synth<CR>", {
  silent = true,
  desc = "Synthesize project",
})

keyset('n', "<F12>", ":OverseerRunCmd make qrtl<CR>", {
  silent = true,
  desc = "Synthesize and view RTL",
})

keyset('n', "<leader>vq", "<CMD>OverseerRunCmd make view<CR>", {
  silent = true,
  desc = "View RTL schematic diagram",
})

keyset('n', "<leader>vy", "<CMD>OverseerRunCmd make ys<CR>", {
  silent = true,
  desc = "View simple RTL diagram with Yosys",
})


-- Utilities
keyset('n', 'gi', '<CMD>VerilogFollowInstance<CR>', {
  silent= true,
  desc = "Follow Instance",
})

keyset('n', 'gp', '<CMD>VerilogFollowPort<CR>', {
  silent= true,
  desc = "Follow Port",
})

keyset('n', 'gI', '<CMD>VerilogGotoInstanceStart<CR>', {
  silent= true,
  desc = "Go to Instance Start",
})

keyset('n', '<leader>V', '<CMD>VerilogErrorFormat Verilator 1<CR>', {
  silent= true,
  desc = "Set Verilator Error format",
})

keyset('n', '<leader>O', '<CMD>Tagbar<CR>', {
  silent= true,
  desc = "Outline symbols",
})
