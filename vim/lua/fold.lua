local M = {}

M.close_all = function()
    if vim.wo.diff and #vim.api.nvim_list_wins() > 1 then
        local win = vim.api.nvim_get_current_win()
        vim.cmd [[windo normal! zm]]
        vim.api.nvim_set_current_win(win)
    end
end

return M
