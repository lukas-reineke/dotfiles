local M = {}

M.hijak = function()
    local path = vim.fn.expand "<amatch>"

    if vim.fn.isdirectory(path) == 0 then
        return
    end

    if path == "" then
        return
    end

    if string.format("%d", vim.fn.bufnr "%") ~= vim.fn.expand "<abuf>" then
        return
    end

    if vim.bo.filetype == "defx" then
        return
    end

    vim.cmd [[Defx -show-ignored-files -new `expand('%:p:h')`]]
end

return M
