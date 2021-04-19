local utils = require "utils"
local M = {}

M.setup = function()
    vim.g.git_head = "HEAD"
end

M.set_head = function(head)
    vim.g.git_head = utils._if(head, head, "HEAD")

    vim.g.gitgutter_diff_base = vim.g.git_head

    local win = vim.api.nvim_get_current_win()
    vim.cmd [[windo GitGutter]]
    vim.api.nvim_set_current_win(win)

    vim.fn["defx#custom#column"]("git", "git_commit", vim.g.git_head)

    print(string.format("Now diffing against %s", vim.g.git_head))
end

return M
