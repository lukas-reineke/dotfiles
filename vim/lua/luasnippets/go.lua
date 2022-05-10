local go = require "refactoring.treesitter.langs.go"
local utils = require "luasnippets.utils"

local regular = {}

local auto = {
    s(
        "ssp",
        fmt(
            [[
                {logger}("{spacer} ┃ {file}:{line} -> {path} -> {input_rep}")
                {logger_rep}({input}) // NO_COMMIT
                {logger_rep}("{spacer}")
            ]],
            {
                logger = c(2, {
                    t "fmt.Println",
                    t "log.Info().Msg",
                }),
                logger_rep = rep(2),
                input = i(1),
                input_rep = rep(1),
                spacer = f(function(args)
                    return args[1][1]:gsub(".", "-")
                end, 1),
                file = f(function()
                    return vim.fn.expand "%:t"
                end),
                path = utils.path(go.new()),
                line = f(function()
                    return tostring(vim.fn.line "." - 2)
                end),
            }
        ),
        { condition = conds.line_begin }
    ),

    s(
        "ssc",
        fmt(
            [[
                {logger}("{file}:{line} -> {path} [{counter}]") // NO_COMMIT
            ]],
            {
                logger = c(1, {
                    t "fmt.Println",
                    t "log.Info().Msg",
                }),
                file = f(function()
                    return vim.fn.expand "%:t"
                end),
                path = utils.path(go.new()),
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
