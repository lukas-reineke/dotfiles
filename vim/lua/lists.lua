local utils = require "utils"
local M = {}

local quickfix = "Quickfix"
local location = "Location"

M.setup = function()
    vim.g.active_list = quickfix
end

M.change_active = function(list)
    vim.g.active_list = list
end

M.toggle_active = function()
    vim.g.active_list = utils._if(vim.g.active_list == quickfix, location, quickfix)
    print(string.format("%s list", vim.g.active_list))
end

M.move = function(direction)
    local wrap
    wrap = function(cmd, backup)
        local status = pcall(vim.cmd, cmd)
        if not status then
            wrap(backup, "echo 'No Errors'")
        end
    end

    if direction == "up" then
        if vim.g.active_list == quickfix then
            wrap("cprevious", "clast")
        else
            wrap("labove", "llast")
        end
    elseif direction == "down" then
        if vim.g.active_list == quickfix then
            wrap("cnext", "cfirst")
        else
            wrap("lbelow", "lfirst")
        end
    elseif direction == "left" then
        if vim.g.active_list == quickfix then
            pcall(vim.cmd, [[colder]])
        else
            pcall(vim.cmd, [[lolder]])
        end
    elseif direction == "right" then
        if vim.g.active_list == quickfix then
            pcall(vim.cmd, [[cnewer]])
        else
            pcall(vim.cmd, [[lnewer]])
        end
    end
end

return M
