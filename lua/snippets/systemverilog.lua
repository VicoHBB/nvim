local ls = require("luasnip")      -- Import LuaSnip
local snip = ls.snippet            -- Create snippet
local txt_node = ls.text_node      -- Text node
local ins_node = ls.insert_node    -- Insert node
local func_node = ls.function_node -- Function node

-- args is a table, where 1 is the text in Placeholder 1, 2 the text in
-- placeholder 2,...
local function copy(args)
    return args[1]
end

local snippets = {

    -- Combinational always block
    snip("alc", {
        txt_node("always_comb begin "),
        ins_node(1, ": /* statement_label */"),
        txt_node({ "", "\t" }),
        ins_node(2, "/* Put your code here */"),
        txt_node({ "", "end " }),
        func_node(copy, 1),
    }),

    -- Sequential always_ff block
    snip("alf", {
        txt_node("always_ff @( "),
        ins_node(1, "event"),
        txt_node(" "),
        ins_node(2, "signal"),
        ins_node(3, "/* , other signal? */"),
        txt_node(" ) begin "),
        ins_node(4, ": /* statement_label */"),
        txt_node({ "", "\t" }),
        ins_node(5, "/* Put your code here */"),
        txt_node({ "", "end " }),
        func_node(copy, 4),
    }),

    -- Latched logic
    snip("all", {
        txt_node("always_latch begin "),
        ins_node(1, ": /* statement_label */"),
        txt_node({ "", "\t" }),
        ins_node(2, "/* Put your code here */"),
        txt_node({ "", "end " }),
        func_node(copy, 1),
    }),

}

return snippets
