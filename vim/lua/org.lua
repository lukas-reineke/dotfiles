local orgmode = require "orgmode"
local M = {}

M.enter = function()
    local line = vim.fn.getline "."
    if vim.startswith(line, "*") then
        orgmode.action "org_mappings.handle_return"
    end
end

return M
