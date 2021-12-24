local cmp = require "cmp"
local types = require "cmp.types"

local M = {}

local priority_map = {
    [types.lsp.CompletionItemKind.EnumMember] = 1,
    [types.lsp.CompletionItemKind.Variable] = 2,
    [types.lsp.CompletionItemKind.Text] = 100,
}

M.kind = function(entry1, entry2)
    local kind1 = entry1:get_kind()
    local kind2 = entry2:get_kind()
    kind1 = priority_map[kind1] or kind1
    kind2 = priority_map[kind2] or kind2
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

M.complete = function()
    if cmp.visible() then
        return cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }()
    else
        return cmp.mapping.complete { reason = cmp.ContextReason.Auto }()
    end
end

return M
