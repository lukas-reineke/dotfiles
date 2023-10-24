return {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = function()
        local gitsigns = require "gitsigns"
        gitsigns.setup()

        vim.keymap.set("n", "gj", gitsigns.next_hunk)
        vim.keymap.set("n", "gk", gitsigns.prev_hunk)
        vim.keymap.set("n", "<Space>ga", gitsigns.stage_hunk)
        vim.keymap.set("n", "<Space>gu", gitsigns.reset_hunk)
        vim.keymap.set("v", "<Space>ga", function()
            gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
        end)
        vim.keymap.set("v", "<Space>gu", function()
            gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
        end)
        vim.keymap.set("n", "<Space>gr", gitsigns.reset_buffer)
        vim.keymap.set({ "o", "x" }, "ig", ":<C-U>Gitsigns select_hunk<CR>")
    end,
}
