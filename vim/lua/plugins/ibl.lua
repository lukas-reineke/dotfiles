return {
    "lukas-reineke/indent-blankline.nvim",
    dev = true,
    config = function()
        require("ibl").setup {
            scope = {
                injected_languages = true,
            },
        }

        local hooks = require "ibl.hooks"
        hooks.register(hooks.type.SCOPE_ACTIVE, function(bufnr)
            return vim.api.nvim_buf_line_count(bufnr) < 2000
        end)
    end,
}
