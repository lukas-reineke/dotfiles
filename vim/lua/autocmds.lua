local group = vim.api.nvim_create_augroup("MyAutogroup", {})

-- vim.api.nvim_create_autocmd("CursorMoved", {
--     group = group,
--     pattern = "*",
--     callback = require("fold").close_all,
-- })
vim.api.nvim_create_autocmd("TextYankPost", {
    group = group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank { higroup = "HighlightedyankRegion", timeout = 150 }
    end,
})
vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove "o"
    end,
})
vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = "dapui_*",
    callback = function()
        vim.opt_local.spell = false
    end,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "dap-repl",
    callback = function(args)
        vim.api.nvim_buf_set_option(args.buf, "buflisted", false)
    end,
})
vim.api.nvim_create_autocmd("VimResized", {
    group = group,
    pattern = "*",
    command = "wincmd =",
})
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     group = group,
--     pattern = "*",
--     callback = require("buffers").write_pre,
-- })
-- vim.api.nvim_create_autocmd("BufWritePost", {
--     group = group,
--     pattern = "*",
--     command = "GitGutter",
-- })
vim.api.nvim_create_autocmd("User", {
    group = group,
    pattern = "FugitiveBlob",
    callback = function()
        vim.opt.winhighlight = "DiffAdd:DiffDeleteOld"
    end,
})
-- vim.api.nvim_create_autocmd("BufEnter", {
--     group = group,
--     pattern = "Cargo.toml",
--     callback = function()
--         vim.keymap.set("n", "<CR>", require("crates").show_popup, {
--             noremap = true,
--             silent = true,
--             buffer = true,
--         })
--     end,
-- })
