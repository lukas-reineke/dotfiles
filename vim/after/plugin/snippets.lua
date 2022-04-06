-- local ls = require "luasnip"
-- local s = ls.snippet
-- local sn = ls.snippet_node
-- local t = ls.text_node
-- local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local l = require("luasnip.extras").lambda
-- local r = require("luasnip.extras").rep
-- local p = require("luasnip.extras").partial
-- local m = require("luasnip.extras").match
-- local n = require("luasnip.extras").nonempty
-- local dl = require("luasnip.extras").dynamic_lambda
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local types = require "luasnip.util.types"
-- local conds = require "luasnip.extras.conditions"

-- local function copy(args)
--     return args[1]
-- end
-- ls.snippets = {
--     all = {
--         s("fn", {
--             t "//Parameters: ",

--             -- function, first parameter is the function, second the Placeholders

--             -- whose text it gets as input.

--             f(copy, 2),

--             t { "", "function " },

--             -- Placeholder/Insert.

--             i(1),

--             t "(",

--             -- Placeholder with initial text.

--             i(2, "int foo"),

--             -- Linebreak

--             t { ") {", "\t" },

--             -- Last Placeholder, exit Point of the snippet. EVERY 'outer' SNIPPET NEEDS Placeholder 0.

--             i(0),

--             t { "", "}" },
--         }),
--     },
-- }
