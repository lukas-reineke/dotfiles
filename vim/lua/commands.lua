vim.api.nvim_create_user_command("GitBase", function(opts)
    require("git").set_base(opts.args)
end, {
    nargs = "*",
    complete = "customlist,fugitive#CompleteObject",
})
