return {
    "yorickpeterse/nvim-pqf",
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
