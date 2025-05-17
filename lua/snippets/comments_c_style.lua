local ls = require("luasnip")      -- Import LuaSnip
local snip = ls.snippet            -- Create snippet
local txt_node = ls.text_node      -- Text node
local ins_node = ls.insert_node    -- Insert node
local func_node = ls.function_node -- Function node

local function create_asterisk_line( args, parent)
    local max_colums = 120
    local current_column = vim.fn.col(".")
    local length = max_colums - ( current_column - 1 )
    local asterisks = string.rep("*", length - 4 ) -- Subtract 4 for "/* " and " */"
    local line = "/*" .. asterisks .. "*/"
    return line
end

local snippets = {

    snip("*ln", {
        func_node(create_asterisk_line, {}),
    }),

    snip("*bc", {
        func_node(create_asterisk_line, {}),
        txt_node({"", "/*    "}),
        ins_node(1,"PUT YOU LABEL HERE"),
        txt_node({"    */", ""}),
        func_node(create_asterisk_line, {}),
    }),

}

return snippets
