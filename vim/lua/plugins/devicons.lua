return {
    "kyazdani42/nvim-web-devicons",
    config = function()
        require("nvim-web-devicons").setup {
            default = true,
        }
    end,
    event = "VeryLazy",
}
