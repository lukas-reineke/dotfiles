return {
    "tpope/vim-fugitive",
    dependencies = {
        "tpope/vim-rhubarb",
    },
    event = "VeryLazy",
    config = function()
        vim.keymap.set("n", "<Space>gd", ":set nosplitright<CR>:execute 'Gvdiff ' .. g:git_base<CR>:set splitright<CR>")
        vim.keymap.set("n", "<Space>gb", ":Git blame<CR>")
        vim.keymap.set("n", "<Space>gs", ":Git<CR>")
        vim.keymap.set("n", "<Space>gc", ":0Gclog<CR>", { noremap = false })
        vim.keymap.set("n", "<Space>gg", function()
            require("lists").change_active "Quickfix"
            vim.cmd(string.format("Git difftool %s", vim.g.git_base))
        end)
    end,
}
