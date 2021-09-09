local M = {}

local org_dash_namespace = vim.api.nvim_create_namespace "org_dash_namespace"
vim.fn.sign_define("CodeBlock", { linehl = "markdownCodeBlockBG" })

M.source_blocks = function()
    if vim.bo.filetype ~= "org" then
        return
    end

    local org_sign_namespace = "org_sign_namespace"
    local bufnr = vim.api.nvim_get_current_buf()
    vim.fn.sign_unplace(org_sign_namespace, { buffer = vim.fn.bufname(bufnr) })
    vim.api.nvim_buf_clear_namespace(0, org_dash_namespace, 1, -1)
    local offset = math.max(vim.fn.line "w0" - 1, 0)
    local range = math.min(vim.fn.line "w$", vim.api.nvim_buf_line_count(bufnr))
    local lines = vim.api.nvim_buf_get_lines(bufnr, offset, range, false)

    local source = false

    for i = 1, #lines do
        local _, source_start = lines[i]:find "#%+BEGIN_SRC"
        if source_start then
            source = true
        end

        if source then
            vim.fn.sign_place(0, org_sign_namespace, "CodeBlock", bufnr, { lnum = i + offset })
        end

        local _, source_end = lines[i]:find "#%+END_SRC"

        if source_end then
            source = false
        end

        local _, dashes = lines[i]:find "^-----+$"
        if dashes then
            vim.api.nvim_buf_set_extmark(bufnr, org_dash_namespace, i - 1 + offset, 0, {
                virt_text = { { ("-"):rep(vim.api.nvim_win_get_width(0)), "markdownBold" } },
                virt_text_pos = "overlay",
                hl_mode = "combine",
            })
        end
    end
end

return M
