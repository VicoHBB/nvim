local ls = require("luasnip")      -- Import LuaSnip
local snip = ls.snippet            -- Create snippet
local txt_node = ls.text_node      -- Text node
local ins_node = ls.insert_node    -- Insert node
local func_node = ls.function_node -- Function node

local snippets = {

    snip("mmd", {
        txt_node({ "```mermaid", "" }),
        txt_node({ "%%{ init: { 'layout': 'elk' } }%%", "" }),
        txt_node({ "%%{ init: { 'flowchart': { 'curve': 'stepBefore' } } }%%", "" }),
        ins_node(1, "/* Put you diagram here */"),
        txt_node({ "","```", "" }),
    }),

}

return snippets
