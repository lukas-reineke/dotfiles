return {
    "numToStr/Navigator.nvim",
    config = function()
        require("Navigator").setup {}
        vim.keymap.set("n", "<C-h>", require("Navigator").left)
        vim.keymap.set("n", "<C-j>", require("Navigator").down)
        vim.keymap.set("n", "<C-k>", require("Navigator").up)
        vim.keymap.set("n", "<C-l>", require("Navigator").right)
    end,
}
