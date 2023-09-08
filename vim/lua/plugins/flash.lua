require("flash").setup {
    labels = "asdfghjkl;vnryrueiwo",
    search = {
        multi_window = false,
    },
    label = {
        uppercase = false,
    },
    modes = {
        search = {
            enabled = true,
        },
        char = {
            enabled = false,
        },
        remote = {
            highlight = { backdrop = false },
            remote_op = { restore = true, motion = true },
        },
    },
    prompt = {
        enabled = false,
    },
}
