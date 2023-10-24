return {
    "yorickpeterse/nvim-pqf",
    ft = { "qf" },
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
