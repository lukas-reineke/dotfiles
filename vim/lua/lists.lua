local utils = require "utils"
local M = {}

local quickfix = "Quickfix"
local location = "Location"

M.setup = function()
    vim.g.active_list = location
end

M.notify_list = function()
    vim.notify_once(string.format("Switched to %s list", vim.g.active_list), vim.log.levels.INFO, {
        title = "Lists",
    })
end

M.change_active = function(list)
    if vim.g.active_list ~= list then
        vim.g.active_list = list
        M.notify_list()
    end
end

M.toggle_active = function()
    vim.g.active_list = utils._if(vim.g.active_list == quickfix, location, quickfix)
    M.notify_list()
end

vim.api.nvim_create_user_command("Filter", function(opts)
    local bang = ""
    if opts.bang then
        bang = "!"
    end
    if vim.g.active_list == quickfix then
        vim.cmd(string.format("Cfilter%s %s", bang, opts.args))
    else
        vim.cmd(string.format("Lfilter%s %s", bang, opts.args))
    end
end, { bang = true })

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
