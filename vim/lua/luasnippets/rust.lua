-- local rust = require "refactoring.treesitter.langs.rust"
local utils = require "luasnippets.utils"

local regular = {}

local auto = {
    s(
        "ssp",
        fmt(
            [[
                println!("{spacer} ┃ {file}:{line} > {path} > {input_rep}");
                println!("{{:?}}", {input}); // NO_COMMIT
                println!("{spacer}");
            ]],
            {
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
                path = utils.path(),
                line = f(function()
                    return tostring(vim.fn.line "." - 2)
                end),
            }
        ),
        { condition = conds.line_begin }
    ),

    -- s(
    --     "ssc",
    --     fmt(
    --         [[
    --             {logger}("{file}:{line} > {path} [{counter}]") // NO_COMMIT
    --         ]],
    --         {
    --             logger = c(1, {
    --                 t "fmt.Println",
    --                 t "log.Info().Msg",
    --             }),
    --             file = f(function()
    --                 return vim.fn.expand "%:t"
    --             end),
    --             path = utils.path(rust.new()),
    --             counter = utils.counter "NO_COMMIT",
    --             line = f(function()
    --                 return tostring(vim.fn.line "." - 2)
    --             end),
    --         }
    --     ),
    --     { condition = conds.line_begin }
    -- ),
}

return regular, auto
