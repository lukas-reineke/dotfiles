local M = {}

M.close_all = function()
    if vim.wo.diff and #vim.api.nvim_list_wins() > 1 then
        local win = vim.api.nvim_get_current_win()
        vim.cmd [[windo normal! zm]]
        vim.api.nvim_set_current_win(win)
    end
end

_G.foldtext = function()
    local line = vim.fn.getline(vim.v.foldstart)
    local line_count = vim.v.foldend - vim.v.foldstart + 1
    local _, whitespace_count = line:find("^%s+")

    return line:sub(1, whitespace_count) .. "祉[" .. line_count .. "] " .. vim.trim(line) .. " "
end

return M
