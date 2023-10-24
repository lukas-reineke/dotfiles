return {
    "Saecki/crates.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    ft = "toml",
    config = function()
        require("crates").setup {
            popup = {
                border = vim.g.floating_window_border_dark,
            },
        }
    end,
}
