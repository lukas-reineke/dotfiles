local M = {}

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
    local line_count = vim.v.foldend - vim.v.foldstart + 1
    local foldtext = vim.treesitter.foldtext()

    if type(foldtext) == "table" then
        local pos = 1
        local whitespace = string.match(foldtext[1][1], "^%s+") or ""
        if #foldtext[1][1] == #whitespace then
            -- First part of the text is just whitespace, insert line count after
            pos = 2
        elseif #whitespace > 0 then
            -- First part of the text has leading whitespace, split it into two parts and insert line count in
            -- between
            foldtext[1][1] = string.gsub(foldtext[1][1], "^%s*", "")
            table.insert(foldtext, 1, { whitespace, {} })
            pos = 2
        end
        table.insert(foldtext, pos, { "] ", "Comment" })
        table.insert(foldtext, pos, { string.format("%d", line_count), "Number" })
        table.insert(foldtext, pos, { "[", "Comment" })
        table.insert(foldtext, pos, { " ", "LspCodeLens" })
    end

    return foldtext
end

return M
