local lists = require "lists"

vim.keymap.set("n", "<Space>w", ":update<CR>")
vim.keymap.set("n", "<Space>q", require("buffers").close)
vim.keymap.set("n", "<Space><C-o>", require("buffers").close_others)
vim.keymap.set("n", "<Space><Space>", "<C-6>")

vim.keymap.set({ "n", "o", "v" }, "H", "^")
vim.keymap.set({ "n", "o", "v" }, "L", "$")
vim.keymap.set({ "n", "v" }, "J", "5j")
vim.keymap.set({ "n", "v" }, "K", "5k")
vim.keymap.set({ "n", "v" }, "j", "v:count ? (v:count > 5 ? \"m'\" . v:count : '') . 'j' : 'gj'", { expr = true })
vim.keymap.set({ "n", "v" }, "k", "v:count ? (v:count > 5 ? \"m'\" . v:count : '') . 'k' : 'gk'", { expr = true })
vim.keymap.set("c", "<C-j>", "<DOWN>")
vim.keymap.set("c", "<C-k>", "<UP>")
vim.keymap.set("n", "<Space>j", function()
    vim.diagnostic.goto_next { float = false }
end)
vim.keymap.set("n", "<Space>k", function()
    vim.diagnostic.goto_prev { float = false }
end)

vim.keymap.set("n", "<Space>N", ":e %:h/")

vim.keymap.set("n", "<Space>z", "1z=")

vim.keymap.set("n", "<Space>rr", ":%s/\\v()", { silent = false })
vim.keymap.set("x", "<Space>rr", ":s/\\v%V()", { silent = false })

vim.keymap.set("x", "P", [['"_d"'.v:register.'P']], { expr = true })

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("v", "p", '"_dP')

vim.keymap.set("n", "x", '"_x')

vim.keymap.set("n", "<UP>", function()
    lists.move "up"
end)
vim.keymap.set("n", "<DOWN>", function()
    lists.move "down"
end)
vim.keymap.set("n", "<LEFT>", function()
    lists.move "left"
end)
vim.keymap.set("n", "<RIGHT>", function()
    lists.move "right"
end)

vim.keymap.set("n", "<Space>a", function()
    lists.change_active "Quickfix"
    vim.api.nvim_feedkeys(":silent grep ", "c", false)
end, { silent = false })

vim.keymap.set("n", "<space>i", function()
    local bufnr = vim.api.nvim_get_current_buf()
    local config = require("ibl.config").get_config(bufnr)
    local scope = require("ibl.scope").get(bufnr, config)
    if scope then
        local row, column = scope:start()
        vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { row + 1, column })
    end
end)

vim.cmd [[cabbrev nw noautocmd write]]
