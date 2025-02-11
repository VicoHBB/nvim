local ls = require("luasnip")          -- Import LuaSnip
local snip = ls.snippet                -- Create snippet
local txt_node = ls.text_node          -- Text node
local ins_node = ls.insert_node        -- Insert node
local func_node = ls.function_node     -- Function node

local snippets = {

  snip("mna", {
    txt_node({"int main( int argc, char *argv[] )",""}),
    txt_node({ "{", "\t" }),
    ins_node(1, "/* Put you code here */"),
    txt_node({ "", "\t" }),
    txt_node({ "return 0;", "" }),
    txt_node({ "}" }),
  }),

  snip("mnv", {
    txt_node({"int main( void )",""}),
    txt_node({ "{", "\t" }),
    ins_node(1, "/* Put you code here */"),
    txt_node({ "", "\t" }),
    txt_node({ "return 0;", "" }),
    txt_node({ "}" }),
  }),

}

return snippets
