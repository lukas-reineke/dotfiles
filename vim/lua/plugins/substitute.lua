return {
    "gbprod/substitute.nvim",
    config = function()
        require("substitute").setup {
            highlight_substituted_text = { timer = 150 },
        }

        vim.keymap.del("n", "grn")
        vim.keymap.del("n", "gra")
        vim.keymap.del("n", "grr")
        vim.keymap.del("n", "gri")

        vim.keymap.set("n", "gr", require("substitute").operator, { noremap = true })
        vim.keymap.set("n", "grr", function()
            require("substitute").line()
            vim.api.nvim_feedkeys("==", "n", false)
        end, { noremap = true })
    end,
}
