local regular = {}

local auto = {
    s(
        "nc",
        f(function()
            return string.format(vim.opt.commentstring:get(), " NO_COMMIT")
        end, {})
    ),
    s(
        "todo ",
        f(function()
            return string.format(vim.opt.commentstring:get(), " @TODO [Lukas]: ")
        end, {}),
        i(1),
        { condition = conds.line_begin }
    ),
}

return regular, auto
