require("virt-column").setup_buffer(0, { virtcolumn = "" })
vim.opt_local.spell = true
vim.opt_local.list = false
vim.opt_local.wrap = false
vim.opt_local.formatoptions:append "t"

vim.keymap.set("n", "<Space>f", function()
    require("fuzzy").headlines("^#+", "#")
end, { buffer = true })
