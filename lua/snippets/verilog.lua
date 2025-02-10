local ls = require("luasnip")          -- Import LuaSnip
local snip = ls.snippet                -- Create snippet
local txt_node = ls.text_node          -- Text node
local ins_node = ls.insert_node        -- Insert node
local func_node = ls.function_node     -- Function node

local snippets = {

  -- posedge
  snip("pe",{
    txt_node("posedge")
  }),

  -- negedge
  snip("ne",{
    txt_node("negedge")
  }),

  -- include
  snip("inc",{
    txt_node('`include "'),
    ins_node(1,"/* File path */"),
    txt_node('"')
  }),

  -- begin end
  snip("bg",{
    txt_node({"begin", ""}),
    txt_node({"\t"}),
    ins_node(1, "/* Put your code here */"),
    txt_node({"","end",})
  }),

  -- typedef struct packed
  snip("tsp", {
    txt_node({ "/*", "" }),
    txt_node(  "* @brief:           "), func_node(copy, 1),
    txt_node({ " structure definition", "" }),
    txt_node(  "* @description:     "), ins_node(3, "Put description here"),
    txt_node({ "", "*/", "" }),
    txt_node({ "typedef struct packed {", "" }),
    txt_node(  "\t"),
    ins_node(2, "/* Put members here */"),
    txt_node({ "", "} " }),
    ins_node(1, "/* Put structure name here */"),
    txt_node("_t;"),
  })
}


return snippets
