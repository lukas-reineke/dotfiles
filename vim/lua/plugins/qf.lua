return {
    "romainl/vim-qf",
    init = function()
        vim.g.qf_nowrap = false
        vim.g.qf_max_height = 20
    end,
    config = function()
        vim.keymap.set(
            "n",
            "<Space>c",
            "<Plug>(qf_qf_toggle_stay):lua require('lists').change_active('Quickfix')<CR>",
            { noremap = false }
        )
        vim.keymap.set(
            "n",
            "<Space>v",
            "<Plug>(qf_loc_toggle_stay):lua require('lists').change_active('Location')<CR>",
            { noremap = false }
        )
    end,
}
