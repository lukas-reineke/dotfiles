return {
    "sindrets/diffview.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        enhanced_diff_hl = true,
        hooks = {
            diff_buf_read = function(_)
                vim.opt_local.cursorlineopt = "number"
                -- vim.opt_local.winhighlight = "DiffDelete:DiffviewDiffDelete"
            end,
        },
    },
}
