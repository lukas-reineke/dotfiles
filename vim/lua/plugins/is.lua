local map = require("utils").map
return {
    "haya14busa/is.vim",
    config = function()
        vim.api.nvim_set_keymap("n", "g*", "<Plug>(is-g*)N", { noremap = false })
        vim.api.nvim_set_keymap("n", "*", "<Plug>(is-*)N", { noremap = false })
    end,
}
