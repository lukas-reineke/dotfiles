local M = {}
local utils = require "utils"

M.close_all = function()
    if vim.wo.diff and #vim.api.nvim_list_wins() > 1 and vim.fn.foldlevel(vim.fn.getcurpos()[2]) == 0 then
        local view = vim.fn.winsaveview()
        local win = vim.api.nvim_get_current_win()
        vim.cmd [[windo normal! zM]]
        vim.api.nvim_set_current_win(win)
        vim.fn.winrestview(view)
    end
end

_G.foldtext = function()
    local line = vim.fn.getline(vim.v.foldstart)
    local line_count = vim.v.foldend - vim.v.foldstart + 1
    local _, whitespace_count = line:find "^%s+"

    return utils._if(whitespace_count, line:sub(1, whitespace_count), "")
        .. "祉["
        .. line_count
        .. "] "
        .. vim.trim(line)
        .. " "
end

return M
