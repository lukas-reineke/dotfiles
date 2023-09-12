return {
    "Wansmer/treesj",
    keys = { "<Space>e" },
    config = function()
        require("treesj").setup {
            use_default_keymaps = false,
            max_join_length = 2000,
        }
        vim.keymap.set("n", "<Space>e", require("treesj").toggle)
    end,
}
