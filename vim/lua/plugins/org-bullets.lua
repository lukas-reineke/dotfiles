require("org-bullets").setup {
    concealcursor = true,
    symbols = {
        checkboxes = {
            cancelled = { "◢", "OrgCancelled" },
            done = { "■", "OrgDone" },
            todo = { " ", "OrgTODO" },
        },
    },
}
