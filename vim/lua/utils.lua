local M = {}

M.merge = function(t1, t2)
    for k, v in pairs(t2) do
        t1[k] = v
    end
    return t1
end

M._if = function(bool, a, b)
    if bool then
        return a
    else
        return b
    end
end

function _G.P(...)
    print(unpack(vim.tbl_map(vim.inspect, { ... })))
end

function _G.R(package)
    package.loaded[package] = nil
    return require(package)
end

function _G.T()
    print(require("nvim-treesitter.ts_utils").get_node_at_cursor():type())
end

M.ansi_codes = {
    _clear = "[0m",
    _red = "[0;31m",
    _green = "[0;32m",
    _yellow = "[0;33m",
    _blue = "[0;34m",
    _magenta = "[0;35m",
    _cyan = "[0;36m",
    _grey = "[0;90m",
    _dark_grey = "[0;97m",
    _white = "[0;98m",
    red = function(self, string)
        return self._red .. string .. self._clear
    end,
    green = function(self, string)
        return self._green .. string .. self._clear
    end,
    yellow = function(self, string)
        return self._yellow .. string .. self._clear
    end,
    blue = function(self, string)
        return self._blue .. string .. self._clear
    end,
    magenta = function(self, string)
        return self._magenta .. string .. self._clear
    end,
    cyan = function(self, string)
        return self._cyan .. string .. self._clear
    end,
    grey = function(self, string)
        return self._grey .. string .. self._clear
    end,
    dark_grey = function(self, string)
        return self._dark_grey .. string .. self._clear
    end,
    white = function(self, string)
        return self._white .. string .. self._clear
    end,
}

M.shorten_string = function(string, length)
    if #string < length then
        return string
    end
    local start = string:sub(1, (length / 2) - 2)
    local _end = string:sub(#string - (length / 2) + 1, #string)
    return start .. "..." .. _end
end

M.wrap_lines = function(input, width)
    local output = {}
    for _, line in ipairs(input) do
        line = line:gsub("\r", "")
        while #line > width + 2 do
            local trimmed_line = string.sub(line, 1, width)
            local index = trimmed_line:reverse():find " "
            if index == nil or index > #trimmed_line / 2 then
                break
            end
            table.insert(output, string.sub(line, 1, width - index))
            line = vim.o.showbreak .. string.sub(line, width - index + 2, #line)
        end
        table.insert(output, line)
    end

    return output
end

return M
