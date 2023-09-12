return {
    "lukas-reineke/lsp-format.nvim",
    dev = true,
    config = function()
        local prettier = {
            tabWidth = function()
                return vim.opt.shiftwidth:get()
            end,
            singleQuote = true,
            trailingComma = "all",
            configPrecedence = "prefer-file",
            exclude = { "tsserver", "jsonls" },
        }

        require("lsp-format").setup {
            typescript = prettier,
            javascript = prettier,
            typescriptreact = prettier,
            javascriptreact = prettier,
            json = prettier,
            css = prettier,
            scss = prettier,
            html = prettier,
            yaml = {
                tabWidth = function()
                    return vim.opt.shiftwidth:get()
                end,
                singleQuote = true,
                trailingComma = "all",
                configPrecedence = "prefer-file",
            },
            python = {
                lineLength = 120,
            },
            markdown = prettier,
            sh = {
                tabWidth = 4,
            },
        }
    end,
    event = "VeryLazy",
}
