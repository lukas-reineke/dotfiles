local regular = {}

local auto = {
    s(
        "src",
        fmt(
            [[
                  #+BEGIN_SRC {}
                  {}
                  #+END_SRC
            ]],
            {
                i(1),
                i(2),
            }
        ),
        { condition = conds.line_begin }
    ),
    s({ trig = "%s*%*", regTrig = true }, t "*", { condition = conds.line_begin }),
    s({ trig = "%s*%-%-%-", regTrig = true }, t "-----", { condition = conds.line_begin }),
}

return regular, auto
