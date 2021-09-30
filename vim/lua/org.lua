local orgmode = require "orgmode"
local M = {}

M.insert_return = function()
    orgmode.action "org_mappings.handle_return"
    vim.schedule(function()
        if vim.fn.mode() ~= "i" then
            vim.api.nvim_feedkeys("o", "n", true)
        end
    end)
end

return M
