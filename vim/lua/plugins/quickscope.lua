return {
    "kepbod/quick-scope",
    event = "VeryLazy",
    config = function()
        vim.api.nvim_set_hl(0, "QuickScopePrimary", {
            bold = true,
            bg = "None",
            fg = "None",
        })
        vim.api.nvim_set_hl(0, "QuickScopeSecondary", {
            bold = true,
            bg = "None",
            fg = "None",
        })
    end,
}
