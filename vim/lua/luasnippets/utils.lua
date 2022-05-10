local ts_utils = require "nvim-treesitter.ts_utils"
local ls = require "luasnip"
local f = ls.function_node

local M = {}

M.path = function(ts)
    return f(function()
        local cursor_node = ts_utils.get_node_at_cursor()
        local debug_path = ts:get_debug_path(cursor_node)
        local path = {}
        for i = #debug_path, 1, -1 do
            table.insert(path, tostring(debug_path[i]))
        end

        return table.concat(path, " -> ")
    end)
end

M.counter = function(pattern)
    return f(function()
        local counter = 0
        local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
        for _, line in ipairs(lines) do
            if line:match(pattern) then
                counter = counter + 1
            end
        end
        return tostring(counter)
    end)
end

return M
