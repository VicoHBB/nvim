lua << EOF

local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")


npairs.setup({
    check_ts = true,
    ts_config = {
      lua = {'string', "source"},-- it will not add a pair on that treesitter node
      javascript = {'string','template_string'},
      -- java = false,-- don't check treesitter on java
    },
    disable_filetype = { "TelescopePrompt" },
    fast_wrap = {
      map = "<C-f>",
      chars = { '{', '[', '(', '"', "'" },
      pattern = [=[[%'%"%>%]%)%}%,]]=],
      offset = 0,
      end_key = '$',
      keys = 'qwertyuiopzxcvbnmasdfghjkl',
      check_comma = true,
      highlight = 'PmenuSel',
      highlight_grey='LineNr'
    },

})

npairs.add_rule(Rule("$$","$$","tex"))

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done{ map_char = { tex ="" } } 
)

EOF
