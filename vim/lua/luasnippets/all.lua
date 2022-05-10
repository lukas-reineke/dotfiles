local regular = {}

local auto = {
    s(
        "nc",
        f(function()
            return string.format(vim.opt.commentstring:get(), "NO_COMMIT")
        end, {})
    ),
    s(
        "todo",
        f(function()
            return string.format(vim.opt.commentstring:get(), "@TODO [Lukas]: ")
        end, {}),
        i(1)
    ),
}

return regular, auto
