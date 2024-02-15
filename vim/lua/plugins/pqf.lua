return {
    "yorickpeterse/nvim-pqf",
    event = "VeryLazy",
    config = function()
        require("pqf").setup {
            signs = {
                error = "",
                warning = "",
                info = "",
                hint = "",
            },
        }
    end,
}
