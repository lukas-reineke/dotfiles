local M = {}

local serverity_map = {
    "DiagnosticError",
    "DiagnosticWarn",
    "DiagnosticInfo",
    "DiagnosticHint",
}
local icon_map = {
    "  ",
    "  ",
    "  ",
    "  ",
}

local function source_string(source)
    return string.format("  [%s]", source)
end

M.line_diagnostics = function()
    local bufnr, lnum = unpack(vim.fn.getcurpos())
    local diagnostics = vim.lsp.diagnostic.get_line_diagnostics(bufnr, lnum - 1, {})
    if vim.tbl_isempty(diagnostics) then
        return
    end

    local lines = {}

    for _, diagnostic in ipairs(diagnostics) do
        table.insert(
            lines,
            icon_map[diagnostic.severity]
                .. " "
                .. diagnostic.message:gsub("\n", " ")
                .. source_string(diagnostic.source)
        )
    end

    local floating_bufnr, _ = vim.lsp.util.open_floating_preview(lines, "plaintext", {
        border = vim.g.floating_window_border_dark,
    })

    for i, diagnostic in ipairs(diagnostics) do
        local message_length = #lines[i] - #source_string(diagnostic.source)
        vim.api.nvim_buf_add_highlight(floating_bufnr, -1, serverity_map[diagnostic.severity], i - 1, 0, message_length)
        vim.api.nvim_buf_add_highlight(floating_bufnr, -1, "DiagnosticSource", i - 1, message_length, -1)
    end
end

return M
