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

    -- posedge
    snip("pe", {
        txt_node("posedge "),
        ins_node(1, "/* Signal Name */"),
    }),

    -- negedge
    snip("ne", {
        txt_node("negedge "),
        ins_node(1, "/* Signal Name */"),
    }),

    -- include
    snip("inc", {
        txt_node('`include "'),
        ins_node(1, "/* File path */"),
        txt_node('"')
    }),

    -- define
    snip("df", {
        txt_node("`define "),
        ins_node(1, "/* NAME */"),
        txt_node(" "),
        ins_node(2, "/* ARGUMENTS */"),
    }),

    -- define macro
    snip("dfm", {
        txt_node("`define "),
        ins_node(1, "/* MACRO NAME */"),
        txt_node(" ( "),
        ins_node(2, "/* MACRO ARGUMENTS */"),
        txt_node(" )"),
    }),

    -- begin end
    snip("bg", {
        txt_node({ "begin", "" }),
        txt_node({ "\t" }),
        ins_node(1, "/* Put your code here */"),
        txt_node({ "", "end", })
    }),

    -- typedef struct packed
    snip("tsp", {
        txt_node({ "/*", "" }),
        txt_node("* @brief:           "), func_node(copy, 1),
        txt_node({ " structure definition", "" }),
        txt_node("* @description:     "), ins_node(3, "Put description here"),
        txt_node({ "", "*/", "" }),
        txt_node({ "typedef struct packed {", "" }),
        txt_node("\t"),
        ins_node(2, "/* Put members here */"),
        txt_node({ "", "} " }),
        ins_node(1, "/* Put structure name here */"),
        txt_node("_t;"),
    }),

    -- typedef enum logic
    snip("tel", {
        txt_node({ "/*", "" }),
        txt_node("* @brief:           "), func_node(copy, 1),
        txt_node({ " enum definition", "" }),
        txt_node("* @description:     "), ins_node(3, "Put description here"),
        txt_node({ "", "*/", "" }),
        txt_node({ "typedef enum " }),
        ins_node(2, "type"),
        txt_node({ " " }),
        ins_node(3, "[ N : 0 ]"),
        txt_node({ " {", "" }),
        txt_node("\t"),
        ins_node(4, "/* Put ENUMS here */"),
        txt_node({ "", "} " }),
        ins_node(1, "/* Put structure name here */"),
        txt_node("_t;"),
    }),

}

return snippets
