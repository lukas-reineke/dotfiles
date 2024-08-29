return {
    "yorickpeterse/nvim-pqf",
    event = "VeryLazy",
    enabled = false,
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
