-- local lua = require "refactoring.treesitter.langs.lua"
local utils = require "luasnippets.utils"

local regular = {
    s(
        "M",
        fmt(
            [[
                local M = {{}}

                {}

                return M
            ]],
            {
                i(1),
            }
        ),
        { condition = conds.line_begin }
    ),

    s(
        "use",
        fmt(
            [[
                use {{
                    "{repo}",
                    config = "require 'plugins.{file}'",
                }}
            ]],
            {
                repo = i(1),
                file = f(function(args)
                    local parts = vim.split(args[1][1]:gsub("-", "_"), "/", true)
                    return parts[#parts] or ""
                end, 1),
            }
        ),
        { condition = conds.line_begin }
    ),
}

local auto = {
    s("ssp", {
        t "_G.P(",
        i(1),
        t ") -- NO_COMMIT",
    }, { condition = conds.line_begin }),

    s(
        "ssc",
        fmt(
            [[
                print("{file}:{line} -> {path} [{counter}]") -- NO_COMMIT
            ]],
            {
                file = f(function()
                    return vim.fn.expand "%:t"
                end),
                -- path = utils.path(lua.new()),
                path = "",
                counter = utils.counter "NO_COMMIT",
                line = f(function()
                    return tostring(vim.fn.line "." - 2)
                end),
            }
        ),
        { condition = conds.line_begin }
    ),

    s(
        "lreq",
        fmt(
            [[
            local {loc} = require "{req}"
        ]],
            {
                req = i(1),
                loc = f(function(args)
                    local parts = vim.split(args[1][1], ".", true)
                    return parts[#parts] or ""
                end, 1),
            }
        ),
        { condition = conds.line_begin }
    ),
}

return regular, auto
