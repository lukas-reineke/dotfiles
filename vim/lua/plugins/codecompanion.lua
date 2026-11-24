return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "github/copilot.vim",
    },
    enabled = false,
    opts = {
        strategies = {
            chat = {
                adapter = "copilot",
            },
        },
        opts = {
            -- Set debug logging
            log_level = "DEBUG",
        },
    },
}
