return {
    "lukas-reineke/indent-blankline.nvim",
    dependencies = { "lukas-reineke/onedark.nvim" },
    dev = true,
    main = "ibl",
    opts = {
        -- indent = {
        --     smart_indent_cap = false,
        -- },
        -- current_indent = {
        --     enabled = true,
        --     -- highlight = "Function",
        -- },
        -- scope = {
        --     enabled = false,
        -- },
        exclude = {
            filetypes = { "org" },
        },
    },
    -- config = function()
    --     local hooks = require "ibl.hooks"
    --     hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    --     hooks.register(hooks.type.CURRENT_INDENT_HIGHLIGHT, hooks.builtin.current_indent_highlight_from_extmark)
    --
    --     local highlight = {
    --         "RainbowRed",
    --         "RainbowYellow",
    --         "RainbowBlue",
    --         "RainbowOrange",
    --         "RainbowGreen",
    --         "RainbowViolet",
    --         "RainbowCyan",
    --     }
    --     hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    --         vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    --         vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    --         vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    --         vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    --         vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    --         vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    --         vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    --     end)
    --     vim.g.rainbow_delimiters = { highlight = highlight }
    --     require("ibl").setup {
    --         current_indent = {
    --             enabled = true,
    --             highlight = highlight,
    --         },
    --         scope = { enabled = false, highlight = highlight },
    --     }
    -- end,
}
