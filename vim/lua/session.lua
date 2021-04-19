local M = {}

M.restore = function()
    for _, filetype in ipairs({"gitcommit", "man"}) do
        if vim.bo.filetype == filetype then
            return
        end
    end

    local f = io.open("./Session.vim", "r")
    if f ~= nil then
        io.close(f)
    else
        return
    end

    vim.cmd [[execute 'so ' . getcwd() . '/Session.vim']]

    if vim.fn.bufexists(1) == 0 then
        return
    end

    for i = 1, vim.fn.bufnr("$") do
        if vim.fn.bufwinnr(i) == -1 then
            vim.cmd(string.format("sbuffer %d", i))
        end
    end
end

return M
