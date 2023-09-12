return {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf", "vijaymarupudi/nvim-fzf" },
    config = function()
        local fuzzy = require "fuzzy"
        vim.g.fzf_buffers_jump = true
        vim.g.fzf_layout = { window = { width = 0.8, height = 0.4, yoffset = 0.2 } }
        vim.cmd [[let $FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS . ' --reverse --ansi']]

        vim.keymap.set("n", "<C-p>", function()
            fuzzy.files ""
        end)
        vim.keymap.set("n", "<Space>gf", fuzzy.git_files)
        vim.keymap.set("n", "<Space>n", function()
            fuzzy.files(vim.fn.expand "%:h")
        end)
        vim.keymap.set("n", "<Space>f", fuzzy.symbols)
        vim.keymap.set("n", "<Space>p", ":Buffers<CR>")
        vim.keymap.set("n", "<Space><C-p>", ":Commands<CR>")
        vim.keymap.set("n", "<Space><C-h>", ":Helptags<CR>")
        vim.keymap.set("n", "<Space>m", ":Marks<CR>")
    end,
    event = "VeryLazy",
}
