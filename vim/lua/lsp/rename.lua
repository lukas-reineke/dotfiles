local M = {}
local utils = require "utils"
local rename_prompt = "Rename ⃗⃗⃗⃗⃗⃗-> "

M.rename = function()
    local current_name = vim.fn.expand("<cword>")
    local orig_bufnr = vim.api.nvim_get_current_buf()
    local bufnr = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_option(bufnr, "buftype", "prompt")
    vim.api.nvim_buf_set_option(bufnr, "bufhidden", "wipe")
    vim.api.nvim_buf_set_var(
        bufnr,
        "rename_vars",
        {
            current_name = current_name,
            params = vim.lsp.util.make_position_params(),
            orig_bufnr = orig_bufnr
        }
    )
    vim.api.nvim_buf_add_highlight(bufnr, -1, "RenamePrompt", 0, 0, #rename_prompt)
    vim.fn.prompt_setprompt(bufnr, rename_prompt)
    local winnr =
        vim.api.nvim_open_win(
        bufnr,
        true,
        {
            relative = "cursor",
            width = 50,
            height = 1,
            row = -3,
            col = 1,
            style = "minimal",
            border = vim.g.floating_window_border
        }
    )
    vim.api.nvim_win_set_option(winnr, "winhl", "Normal:Floating")
    utils.map("n", "<ESC>", "<cmd>bd!<CR>", {silent = true, buffer = true})
    utils.map({"n", "i"}, "<CR>", "<cmd>lua require('lsp.rename').callback()<CR>", {silent = true, buffer = true})
    utils.map("i", "<BS>", "<ESC>xi", {silent = true, buffer = true})
    vim.cmd(string.format("normal i%s", current_name))
end

M.callback = function()
    local new_name = vim.trim(vim.fn.getline("."):sub(#rename_prompt + 1, -1))
    local vars = vim.api.nvim_buf_get_var(0, "rename_vars")
    vim.cmd [[stopinsert]]
    vim.cmd [[bd!]]
    if #new_name == 0 or new_name == vars.current_name then
        return
    end
    vars.params.newName = new_name
    vim.lsp.buf_request(vars.orig_bufnr, "textDocument/rename", vars.params)
end

return M
