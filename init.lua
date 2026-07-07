-- [[ Verify OS ]]
if vim.fn.has("win32") == 1 then
    Is_Not_Win32 = false
elseif vim.fn.has("unix") == 1 or vim.fn.has("mac") == 1 then
    Is_Not_Win32 = true
end

-- Make Mason-managed binaries available in PATH before any plugin or LSP loads.
-- Mason's setup() normally does this, but only when the plugin is loaded.
-- With cmd-based lazy loading, Mason loads too late for auto-starting LSP servers.
local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
if vim.fn.isdirectory(mason_bin) == 1 then
    vim.env.PATH = mason_bin .. ":" .. vim.env.PATH
end

require('core')
