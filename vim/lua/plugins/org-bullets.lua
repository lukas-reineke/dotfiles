require("org-bullets").setup {
    concealcursor = true,
    symbols = {
        checkboxes = {
            half = { "", "OrgCancelled" },
            done = { "", "OrgDone" },
            todo = { " ", "OrgTODO" },
        },
    },
}
