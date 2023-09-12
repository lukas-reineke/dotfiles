-- local python = require "refactoring.treesitter.langs.python"
local utils = require "luasnippets.utils"

local regular = {
    s(
        "try",
        fmt(
            [[
                try:
                    {try}
                except {exception}{as}:
                    {except}
            ]],
            {
                try = i(1, "..."),
                exception = i(2, "Exception"),
                as = c(3, { t " as error", t "" }),
                except = i(4, "..."),
            }
        ),
        { condition = conds.line_begin }
    ),
}

local auto = {
    s(
        "ssp",
        fmt(
            [[
                {logger}("{spacer} ┃ {file}:{line} > {path} > {input_rep}")
                {logger_rep}({input})  # NO_COMMIT
                {logger_rep}("{spacer}")
            ]],
            {
                logger = c(2, {
                    t "print",
                    t "logger.info",
                }),
                logger_rep = rep(2),
                input = i(1),
                input_rep = f(function(args)
                    return args[1][1]:gsub('"', '\\"'):gsub("\n", " ")
                end, 1),
                spacer = f(function(args)
                    return args[1][1]:gsub(".", "-")
                end, 1),
                file = f(function()
                    return vim.fn.expand "%:t"
                end, {}),
                path = "",
                -- path = utils.path(python.new()),
                line = f(function()
                    return tostring(vim.fn.line "." - 2)
                end, {}),
            }
        ),
        { condition = conds.line_begin }
    ),

    s(
        "ssc",
        fmt(
            [[
                {logger}("{file}:{line} > {path} [{counter}]")  # NO_COMMIT
            ]],
            {
                logger = c(1, {
                    t "print",
                    t "logger.info",
                }),
                file = f(function()
                    return vim.fn.expand "%:t"
                end),
                -- path = utils.path(python.new()),
                path = "",
                counter = utils.counter "NO_COMMIT",
                line = f(function()
                    return tostring(vim.fn.line "." - 2)
                end),
            }
        ),
        { condition = conds.line_begin }
    ),
}

return regular, auto
