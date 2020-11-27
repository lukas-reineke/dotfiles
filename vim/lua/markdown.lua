vim.fn.sign_define("firstHeadline", {linehl = "markdownFirstHeadline"})
vim.fn.sign_define("secondHeadline", {linehl = "markdownSecondHeadline"})
vim.fn.sign_define("thirdHeadline", {linehl = "markdownHeadline"})

local markdown_dash_namespace = vim.api.nvim_create_namespace("markdown_dash")

_G.MarkdownHeadlines = function()
    if vim.bo.filetype ~= "markdown" and vim.bo.filetype ~= "vimwiki" then
        return
    end

    local markdown_sign_namespace = "markdown_sign_namespace"
    local bufnr = vim.api.nvim_get_current_buf()
    vim.fn.sign_unplace(markdown_sign_namespace, {buffer = vim.fn.bufname(bufnr)})
    vim.api.nvim_buf_clear_namespace(0, markdown_dash_namespace, 1, -1)
    local offset = math.max(vim.fn.line("w0") - 1, 0)
    local range = math.min(vim.fn.line("w$"), vim.api.nvim_buf_line_count(bufnr))
    local lines = vim.api.nvim_buf_get_lines(bufnr, offset, range, false)
    local marker = "#"

    for i = 1, #lines do
        _, level = lines[i]:find("^" .. marker .. "+")
        if level == 1 then
            vim.fn.sign_place(0, markdown_sign_namespace, "firstHeadline", bufnr, {lnum = i + offset})
        end
        if level == 2 then
            vim.fn.sign_place(0, markdown_sign_namespace, "secondHeadline", bufnr, {lnum = i + offset})
        end
        if level and level > 2 then
            vim.fn.sign_place(0, markdown_sign_namespace, "thirdHeadline", bufnr, {lnum = i + offset})
        end

        _, dashes = lines[i]:find("^---+$")
        if dashes then
            vim.api.nvim_buf_set_virtual_text(
                bufnr,
                markdown_dash_namespace,
                i - 1 + offset,
                {{("-"):rep(500), "markdownBold"}},
                vim.empty_dict()
            )
        end

        ::continue::
    end
end

vim.cmd [[autocmd FileChangedShellPost,Syntax,TextChanged,InsertLeave,WinScrolled * lua MarkdownHeadlines()]]
