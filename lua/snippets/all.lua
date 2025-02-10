local ls = require("luasnip")          -- Import LuaSnip
local snip = ls.snippet                -- Create snippet
local txt_node = ls.text_node          -- Text node
local ins_node = ls.insert_node        -- Insert node
local func_node = ls.function_node     -- Function node

local snippets = {

  snip("@f",{
    txt_node("@FIX: "),
    ins_node(1, "Put your FIX description here")
  }),

  snip("@b",{
    txt_node("@BUG: "),
    ins_node(1, "Put your BUG description here")
  }),

  snip("@t",{
    txt_node("@TODO: "),
    ins_node(1, "Put your TODO description here")
  }),

  snip("@h",{
    txt_node("@HACK: "),
    ins_node(1, "Put your HACK description here")
  }),

  snip("@w",{
    txt_node("@WARN: "),
    ins_node(1, "Put your WARN description here")
  }),

  snip("@p",{
    txt_node("@PERF: "),
    ins_node(1, "Put you PERF description here")
  }),

  snip("@n",{
    txt_node("@NOTE: "),
    ins_node(1, "Put you NOTE description here")
  }),

  snip("@te",{
    txt_node("@TEST: "),
    ins_node(1, "Put you TEST description here")
  })

}

return snippets
