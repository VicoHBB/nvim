local ls = require("luasnip")      -- Import LuaSnip
local snip = ls.snippet            -- Create snippet
local txt_node = ls.text_node      -- Text node
local ins_node = ls.insert_node    -- Insert node
local func_node = ls.function_node -- Function node

-- Get the comment string prefix for the current filetype
local get_comment_prefix = function()
    local comment_format = vim.bo.commentstring
    if comment_format then
        local prefix = comment_format:match("^(.-)%%s")
        if prefix then
            return prefix
        end
        return comment_format .. " "
    end
    return "# "
end

local snippets = {

    snip("tdf", {
        func_node(get_comment_prefix, {}),
        txt_node("@FIX: "),
        ins_node(1, "Put your FIX description here")
    }),

    snip("tdb", {
        func_node(get_comment_prefix, {}),
        txt_node("@BUG: "),
        ins_node(1, "Put your BUG description here")
    }),

    snip("tdt", {
        func_node(get_comment_prefix, {}),
        txt_node("@TODO: "),
        ins_node(1, "Put your TODO description here")
    }),

    snip("tdh", {
        func_node(get_comment_prefix, {}),
        txt_node("@HACK: "),
        ins_node(1, "Put your HACK description here")
    }),

    snip("tdw", {
        func_node(get_comment_prefix, {}),
        txt_node("@WARN: "),
        ins_node(1, "Put your WARN description here")
    }),

    snip("tdp", {
        func_node(get_comment_prefix, {}),
        txt_node("@PERF: "),
        ins_node(1, "Put you PERF description here")
    }),

    snip("tdn", {
        func_node(get_comment_prefix, {}),
        txt_node("@NOTE: "),
        ins_node(1, "Put you NOTE description here")
    }),

    snip("tdte", {
        func_node(get_comment_prefix, {}),
        txt_node("@TEST: "),
        ins_node(1, "Put you TEST description here")
    })

}

return snippets
