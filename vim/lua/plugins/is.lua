return {
    "haya14busa/is.vim",
    config = function()
        vim.keymap.set({ "n", "o" }, "*", "<Plug>(is-*)N", { noremap = false })
        vim.keymap.set({ "n", "o" }, "g*", "<Plug>(is-g*)N", { noremap = false })
    end,
}
