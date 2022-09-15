require("dapui").setup {
    icons = { expanded = "", collapsed = "" },
    layouts = {
        {
            elements = {
                { id = "scopes", size = 0.5 },
                "breakpoints",
                "stacks",
                "watches",
            },
            size = 60,
            position = "left",
        },
        {
            elements = {
                "repl",
                "console",
            },
            size = 0.25,
            position = "bottom",
        },
    },
    floating = {
        border = vim.g.floating_window_border,
    },
}
