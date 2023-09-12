return {
    "kevinhwang91/nvim-bqf",
    config = function()
        require("bqf").setup {
            preview = {
                delay_syntax = 0,
            },
        }
    end,
}
