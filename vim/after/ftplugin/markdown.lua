local ok, virt_column = pcall(require, "virt-column")
if ok then
    virt_column.setup_buffer(0, { virtcolumn = "" })
end

vim.opt_local.spell = true
vim.opt_local.list = false
vim.opt_local.wrap = false
vim.opt_local.formatoptions:append "t"

vim.keymap.set("n", "<Space>f", function()
    require("fuzzy").headlines("^#+", "#")
end, { buffer = true })
