return {
    "luckasRanarison/clear-action.nvim",
    opts = {
        signs = {
            icons = {
                quickfix = "  ",
                refactor = " 󰌵 ",
                source = "  ",
                combined = " 󰌵 ",
            },
        },
        popup = {
            hide_cursor = true,
            border = vim.g.floating_window_border_dark,
        },
        mappings = {
            code_action = "<Space>y",
        },
    },
}
