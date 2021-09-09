local M = {}

M.setup = function()
    vim.fn.sign_define("firstHeadline", { linehl = "markdownFirstHeadline" })
    vim.fn.sign_define("secondHeadline", { linehl = "markdownSecondHeadline" })
    vim.fn.sign_define("thirdHeadline", { linehl = "markdownHeadline" })
end

local markdown_dash_namespace = vim.api.nvim_create_namespace "markdown_dash"

M.headlines = function()
    if vim.bo.filetype ~= "markdown" and vim.bo.filetype ~= "vimwiki" then
        return
    end

    local markdown_sign_namespace = "markdown_sign_namespace"
    local bufnr = vim.api.nvim_get_current_buf()
    vim.fn.sign_unplace(markdown_sign_namespace, { buffer = vim.fn.bufname(bufnr) })
    vim.api.nvim_buf_clear_namespace(0, markdown_dash_namespace, 1, -1)
    local offset = math.max(vim.fn.line "w0" - 1, 0)
    local range = math.min(vim.fn.line "w$", vim.api.nvim_buf_line_count(bufnr))
    local lines = vim.api.nvim_buf_get_lines(bufnr, offset, range, false)
    local marker = "#"

    for i = 1, #lines do
        local _, level = lines[i]:find("^" .. marker .. "+")
        if level == 1 then
            vim.fn.sign_place(0, markdown_sign_namespace, "firstHeadline", bufnr, { lnum = i + offset })
        end
        if level == 2 then
            vim.fn.sign_place(0, markdown_sign_namespace, "secondHeadline", bufnr, { lnum = i + offset })
        end
        if level and level > 2 then
            vim.fn.sign_place(0, markdown_sign_namespace, "thirdHeadline", bufnr, { lnum = i + offset })
        end

        local _, dashes = lines[i]:find "^---+$"
        if dashes then
            vim.api.nvim_buf_set_extmark(bufnr, markdown_dash_namespace, i - 1 + offset, 0, {
                virt_text = { { ("-"):rep(vim.api.nvim_win_get_width(0)), "markdownBold" } },
                virt_text_pos = "overlay",
                hl_mode = "combine",
            })
        end
    end
end

return M
