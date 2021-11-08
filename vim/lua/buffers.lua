local utils = require "utils"
local M = {}

M.close_others = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local last_buffer = vim.fn.bufnr "$"
    local deleted = 0
    local n = 1
    while n <= last_buffer do
        if n ~= bufnr and vim.fn.buflisted(n) ~= 0 then
            if vim.api.nvim_buf_get_option(n, "modified") then
                print(string.format("Buffer %d is modified", n))
                vim.cmd(string.format("buffer %d", n))
                return
            else
                vim.cmd(string.format("silent bdel %d", n))
                if vim.fn.buflisted(n) == 0 then
                    deleted = deleted + 1
                end
            end
        end

        n = n + 1
    end

    vim.cmd [[silent only]]

    print(utils._if(deleted == 1, "1 buffer deleted", string.format("%d buffers deleted", deleted)))
end

M.count = function()
    local count = 0
    local last_buffer = vim.fn.bufnr "$"
    local n = 1
    while n <= last_buffer do
        if vim.fn.buflisted(n) ~= 0 then
            count = count + 1
        end
        n = n + 1
    end

    return count
end

M.close = function()
    if M.count() <= 1 then
        vim.cmd [[q]]
    else
        vim.cmd [[bd]]
    end
end

M.write_pre = function()
    local dir = vim.fn.expand "%:p:h"
    if vim.fn.isdirectory(dir) == 0 then
        vim.fn.mkdir(dir, "p")
    end
end

return M
