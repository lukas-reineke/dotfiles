local M = {}

local types = require "cmp.types"
M.kind = function(entry1, entry2)
    local kind1 = entry1:get_kind()
    kind1 = kind1 == types.lsp.CompletionItemKind.Text and 100 or kind1
    kind1 = kind1 == types.lsp.CompletionItemKind.Variable and 1 or kind1
    local kind2 = entry2:get_kind()
    kind2 = kind2 == types.lsp.CompletionItemKind.Text and 100 or kind2
    kind2 = kind2 == types.lsp.CompletionItemKind.Variable and 1 or kind2
    if kind1 ~= kind2 then
        if kind1 == types.lsp.CompletionItemKind.Snippet then
            return true
        end
        if kind2 == types.lsp.CompletionItemKind.Snippet then
            return false
        end
        local diff = kind1 - kind2
        if diff < 0 then
            return true
        elseif diff > 0 then
            return false
        end
    end
end

return M
