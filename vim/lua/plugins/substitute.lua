return {
    "gbprod/substitute.nvim",
    keys = { "gr", "grr" },
    config = function()
        require("substitute").setup {
            highlight_substituted_text = { timer = 150 },
        }

        vim.keymap.set("n", "gr", require("substitute").operator, { noremap = true })
        vim.keymap.set("n", "grr", function()
            require("substitute").line()
            vim.api.nvim_feedkeys("==", "n", false)
        end, { noremap = true })
    end,
}
