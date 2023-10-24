return {
    "lukas-reineke/virt-column.nvim",
    dev = true,
    config = function()
        require("virt-column").setup {}
        require("virt-column").overwrite {
            virtcolumn = "+1",
            highlight = "VirtColumn",
            exclude = {
                filetypes = {
                    "lspinfo",
                    "packer",
                    "checkhealth",
                    "man",
                    "TelescopePrompt",
                    "TelescopeResults",
                },
            },
        }
    end,
}
