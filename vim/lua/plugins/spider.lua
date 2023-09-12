return {
    "chrisgrieser/nvim-spider",
    config = function()
        vim.keymap.set({ "n", "o", "x" }, "w", function()
            require("spider").motion "w"
        end)
        vim.keymap.set({ "n", "o", "x" }, "e", function()
            require("spider").motion "e"
        end)
        vim.keymap.set({ "n", "o", "x" }, "b", function()
            require("spider").motion "b"
        end)
        vim.keymap.set({ "n", "o", "x" }, "ge", function()
            require("spider").motion "ge"
        end)
    end,
}
