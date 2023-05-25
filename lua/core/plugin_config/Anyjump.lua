-- Show line numbers in search rusults
vim.g.any_jump_list_numbers = 1

-- Auto search references
vim.g.any_jump_references_enabled = 1

-- Auto group results by filename
vim.g.any_jump_grouping_enabled = 0

-- Amount of preview lines for each search result
vim.g.any_jump_preview_lines_count = 5

-- Max search results, other results can be opened via [a]
vim.g.any_jump_max_search_results = 25

-- Prefered search engine: rg or ag
vim.g.any_jump_search_prefered_engine = 'rg'


-- Search results list styles:
-- - 'filename_first'
-- - 'filename_last'
vim.g.any_jump_results_ui_style = 'filename_first'

-- Any-jump window size & position options
vim.g.any_jump_window_width_ratio  = 0.6
vim.g.any_jump_window_height_ratio = 0.6
vim.g.any_jump_window_top_offset   = 4

-- Customize any-jump colors with extending default color scheme:
-- Or override all default colors
-- let g:any_jump_colors = {
--       \"plain_text":         "Comment",
--       \"preview":            "Comment",
--       \"preview_keyword":    "Operator",
--       \"heading_text":       "Function",
--       \"heading_keyword":    "Identifier",
--       \"group_text":         "Comment",
--       \"group_name":         "Function",
--       \"more_button":        "Operator",
--       \"more_explain":       "Comment",
--       \"result_line_number": "Comment",
--       \"result_text":        "Statement",
--       \"result_path":        "String",
--       \"help":               "Comment"
--       \}

-- Disable default any-jump keybindings (default: 0)
vim.g.any_jump_disable_default_keybindings = 0

-- Remove comments line from search results (default: 1)
vim.g.any_jump_remove_comments_from_results = 1

-- Custom ignore files
-- default is: ['*.tmp', '*.temp']
vim.g.any_jump_ignored_files = { '*.tmp', '*.temp' }

-- Search references only for current file type
-- (default: false, so will find keyword in all filetypes)
vim.g.any_jump_references_only_for_current_filetype = 0

-- Disable search engine ignore vcs untracked files
-- (default: false, search engine will ignore vcs untracked files)
 vim.g.any_jump_disable_vcs_ignore = 0
