local M = {}

M.titlecase = function(str)
    return string.gsub(str, "(%a)(.*)", function(first, rest)
        return first:upper() .. rest:lower()
    end)
end

return M
