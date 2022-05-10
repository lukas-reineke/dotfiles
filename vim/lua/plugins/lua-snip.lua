require("luasnip.loaders.from_lua").load { paths = "~/dotfiles/vim/lua/luasnippets" }

require("luasnip").config.set_config {
    history = true,
    enable_autosnippets = true,
    updateevents = "TextChanged,TextChangedI",
    delete_check_events = "TextChanged",
    ext_opts = {
        [require("luasnip.util.types").choiceNode] = {
            active = {
                virt_text = { { "↺", "markdownBold" } },
            },
        },
    },
}
