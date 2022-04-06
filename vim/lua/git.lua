local M = {}

M.is_repo = function()
    vim.fn.system "git -C . rev-parse"
    return vim.v.shell_error == 0
end

M.setup = function()
    vim.g.git_base = "HEAD"
end

M.set_base = function(base)
    if not base or base == "" then
        base = "HEAD"
    end
    vim.g.git_base = base

    vim.g.gitgutter_diff_base = vim.g.git_base

    local win = vim.api.nvim_get_current_win()
    vim.cmd [[noautocmd windo GitGutter]]
    vim.api.nvim_set_current_win(win)

    print(string.format("Now diffing against %s", vim.g.git_base))
end

return M
