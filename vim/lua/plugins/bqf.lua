return {
    "kevinhwang91/nvim-bqf",
    event = "VeryLazy",
    enabled = false,
    config = function()
        require("bqf").setup {
            preview = {
                delay_syntax = 0,
            },
        }
    end,
}
