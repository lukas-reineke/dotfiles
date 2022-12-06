local typescript = require "refactoring.treesitter.langs.typescript"
local utils = require "luasnippets.utils"

local regular = {
    s(
        "describe",
        fmt([[
            describe('{input}', () => {{
            }});
        ]], { input = i(1) })
    ),
    s(
        "it",
        fmt([[
            it('should {input}', async () => {{
            }});
        ]], { input = i(1) })
    ),
}

local auto = {
    s(
        "cns",
        fmt([[console.log({input}) // NO_COMMIT]], {
            input = i(1),
        })
    ),

    s(
        "ssp",
        fmt(
            [[
                {logger}("{spacer} ┃ {file}:{line} > {path} > {input_rep}")
                {logger}({input}) // NO_COMMIT
                {logger}("{spacer}")
            ]],
            {
                logger = t "console.log",
                input = i(1),
                input_rep = f(function(args)
                    return args[1][1]:gsub('"', '\\"'):gsub("\n", " ")
                end, 1),
                spacer = f(function(args)
                    return args[1][1]:gsub(".", "-")
                end, 1),
                file = f(function()
                    return vim.fn.expand "%:t"
                end),
                path = utils.path(typescript.new()),
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
                {logger}("{file}:{line} > {path} [{counter}]") // NO_COMMIT
            ]],
            {
                logger = t "console.log",
                file = f(function()
                    return vim.fn.expand "%:t"
                end),
                path = utils.path(typescript.new()),
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
