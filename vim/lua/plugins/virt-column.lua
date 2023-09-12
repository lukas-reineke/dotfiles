return {
    "lukas-reineke/virt-column.nvim",
    dev = true,
    config = function()
        require("virt-column").setup { virtcolumn = "+1" }
    end,
}
