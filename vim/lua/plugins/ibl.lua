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
        exclude = {
            filetypes = { "org" },
        },
    },
    -- config = function()
    --     local highlight = {
    --         "HeadlineRed",
    --         "HeadlineBlue",
    --     }
    --     require("ibl").setup {
    --         indent = { highlight = highlight, char = "" },
    --         whitespace = {
    --             highlight = highlight,
    --             remove_blankline_trail = false,
    --         },
    --         scope = { enabled = false },
    --     }
    -- end,
    -- config = function()
    --     require("ibl").setup {
    --         viewport_buffer = {},
    --     }
    --     local hooks = require "ibl.hooks"
    --     hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    -- end,
    -- config = function()
    --     local utils = require "ibl.utils"
    --     local hooks = require "ibl.hooks"
    --     -- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    --     -- hooks.register(hooks.type.CURRENT_INDENT_HIGHLIGHT, hooks.builtin.current_indent_highlight_from_extmark)
    --     --
    --     -- local highlight = {
    --     --     "RainbowRed",
    --     --     "RainbowYellow",
    --     --     "RainbowBlue",
    --     --     "RainbowOrange",
    --     --     "RainbowGreen",
    --     --     "RainbowViolet",
    --     --     "RainbowCyan",
    --     -- }
    --     -- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    --     --     vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    --     --     vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    --     --     vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    --     --     vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    --     --     vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    --     --     vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    --     --     vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    --     -- end)
    --     -- vim.g.rainbow_delimiters = { highlight = highlight }
    --
    --     hooks.register(hooks.type.VIRTUAL_TEXT, function(_, bufnr, row, virt_text)
    --         -- Get the line for this row
    --         local line = vim.api.nvim_buf_get_lines(bufnr, row, row + 1, false)[1]
    --
    --         -- Check if it has trailing whitespace
    --         if #line == 0 or #line ~= #utils.get_whitespace(line) then
    --             return virt_text
    --         end
    --
    --         -- Iterate over the virtual text
    --         for i, cell in ipairs(virt_text) do
    --             -- Iterate over each virtual text cell
    --             for j, highlight_group in ipairs(cell[2]) do
    --                 -- Overwrite any highlight that is whitespace
    --                 if vim.startswith(highlight_group, "@ibl.whitespace") then
    --                     virt_text[i][2][j] = "Error"
    --                 end
    --             end
    --         end
    --         return virt_text
    --     end)
    --
    --     require("ibl").setup {
    --         -- current_indent = {
    --         --     enabled = true,
    --         --     highlight = highlight,
    --         -- },
    --         -- scope = { enabled = false, highlight = highlight },
    --     }
    -- end,
}
