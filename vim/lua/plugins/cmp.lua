return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "andersevenrud/cmp-tmux",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-cmdline",
        "dmitmel/cmp-cmdline-history",
        { "lukas-reineke/cmp-under-comparator", dev = true },
        { "lukas-reineke/cmp-rg", dev = true },
        { "lukas-reineke/cmp-conventional-commits", dev = true },
        "octaltree/cmp-look",
        "rcarriga/cmp-dap",
        "petertriho/cmp-git",
        "lttr/cmp-jira",
    },
    event = { "InsertEnter", "CmdlineEnter" },
    config = function()
        local cmp = require "cmp"
        local types = require "cmp.types"
        local dev_icons = require "nvim-web-devicons"
        require("cmp_git").setup()
        require("cmp_jira").setup()

        local confirm_key = nil
        cmp.event:on("confirm_done", function()
            if confirm_key ~= nil then
                vim.fn.feedkeys(confirm_key)
            end
        end)

        local confirm = function(fallback, key)
            if cmp.visible() then
                confirm_key = key
                return cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                }(fallback)
            else
                return fallback()
            end
        end

        local priority_map = {
            [types.lsp.CompletionItemKind.EnumMember] = 1,
            [types.lsp.CompletionItemKind.Variable] = 2,
            [types.lsp.CompletionItemKind.Text] = 100,
        }

        local kind = function(entry1, entry2)
            local kind1 = entry1:get_kind()
            local kind2 = entry2:get_kind()
            kind1 = priority_map[kind1] or kind1
            kind2 = priority_map[kind2] or kind2
            if kind1 ~= kind2 then
                local diff = kind1 - kind2
                if diff < 0 then
                    return true
                elseif diff > 0 then
                    return false
                end
            end
        end

        cmp.setup {
            preselect = cmp.PreselectMode.None,
            completion = {
                keyword_length = 0,
                autocomplete = false,
            },

            mapping = {
                ["<C-d>"] = cmp.mapping.scroll_docs(-5),
                ["<C-f>"] = cmp.mapping.scroll_docs(5),
                ["<C-e>"] = cmp.mapping.close(),
                ["<CR>"] = function(fallback)
                    return confirm(fallback, nil)
                end,
                ["."] = function(fallback)
                    return confirm(fallback, ".")
                end,
                [":"] = function(fallback)
                    return confirm(fallback, ":")
                end,
                [" "] = function(fallback)
                    return confirm(fallback, " ")
                end,
                ["("] = function(fallback)
                    return confirm(fallback, " ")
                end,
                ["<C-n>"] = function(fallback)
                    confirm_key = nil
                    if cmp.visible() then
                        return cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select }(fallback)
                    else
                        return cmp.mapping.complete { reason = cmp.ContextReason.Auto }(fallback)
                    end
                end,
                ["<C-p>"] = function(fallback)
                    confirm_key = nil
                    if cmp.visible() then
                        return cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select }(fallback)
                    else
                        return fallback()
                    end
                end,
            },

            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },

            sorting = {
                priority_weight = 100,
                comparators = {
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    require("cmp-under-comparator").under,
                    kind,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.locality,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                },
            },

            sources = {
                { name = "path", priority = 110 },
                { name = "cmp_jira", priority = 110 },
                { name = "conventional_commits", priority = 110 },
                { name = "orgmode", priority = 110 },
                { name = "crates", priority = 110 },
                { name = "dap", priority = 110 },
                { name = "git", priority = 110 },
                { name = "lazydev", priority = 110, group_index = 0 },
                { name = "nvim_lsp", max_item_count = 20, priority = 100 },
                { name = "nvim_lua", priority = 90 },
                { name = "luasnip", priority = 80 },
                {
                    name = "buffer",
                    max_item_count = 5,
                    priority = 50,
                    entry_filter = function(entry)
                        return not entry.exact
                    end,
                },
                {
                    name = "rg",
                    keyword_length = 5,
                    max_item_count = 5,
                    priority = 60,
                    option = {
                        additional_arguments = "--smart-case --hidden",
                        set_filetype = true,
                        marker = " ❰❰❰",
                    },
                    entry_filter = function(entry)
                        return not entry.exact
                    end,
                },
                { name = "tmux", max_item_count = 5, option = { all_panes = false }, priority = 50 },
                {
                    name = "look",
                    keyword_length = 5,
                    max_item_count = 5,
                    option = { convert_case = true, loud = true },
                    priority = 40,
                    entry_filter = function(entry)
                        return not entry.exact
                    end,
                },
            },

            formatting = {
                format = function(entry, vim_item)
                    local menu_map = {
                        gh_issues = "[Issues]",
                        buffer = "[Buf]",
                        nvim_lsp = "[LSP]",
                        nvim_lua = "[API]",
                        path = "[Path]",
                        luasnip = "[Snip]",
                        tmux = "[Tmux]",
                        look = "[Look]",
                        rg = "[RG]",
                        crates = "[Crates]",
                        orgmode = "[ORG]",
                        dap = "[DAP]",
                        cmp_jira = "[JIRA]",
                    }
                    vim_item.menu = menu_map[entry.source.name] or string.format("[%s]", entry.source.name)

                    if vim_item.kind == "File" then
                        vim_item.kind = dev_icons.get_icon(vim_item.word, nil, { default = true }) .. " [file]"
                    else
                        vim_item.kind = vim.lsp.protocol.CompletionItemKind[vim_item.kind]
                    end

                    return vim_item
                end,
            },

            window = {
                documentation = {
                    border = vim.g.floating_window_border_dark,
                },
                completion = {
                    border = vim.g.floating_window_border_dark,
                },
            },

            experimental = {
                ghost_text = true,
            },
        }

        local cmdline_mappings = {
            select_next_item = {
                c = function(fallback)
                    if cmp.visible() then
                        return cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }(fallback)
                    else
                        return cmp.mapping.complete { reason = cmp.ContextReason.Auto }(fallback)
                    end
                end,
            },
            select_prev_item = {
                c = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
            },
        }

        cmp.setup.cmdline(":", {
            mapping = {
                ["<C-n>"] = cmdline_mappings.select_next_item,
                ["<Tab>"] = cmdline_mappings.select_next_item,
                ["<C-p>"] = cmdline_mappings.select_prev_item,
                ["<S-Tab>"] = cmdline_mappings.select_prev_item,
            },
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }, {
                { name = "buffer" },
            }, {
                { name = "cmdline_history" },
            }),
        })
        cmp.setup.cmdline("/", {
            mapping = {
                ["<C-n>"] = cmdline_mappings.select_next_item,
                ["<Tab>"] = cmdline_mappings.select_next_item,
                ["<C-p>"] = cmdline_mappings.select_prev_item,
                ["<S-Tab>"] = cmdline_mappings.select_prev_item,
            },
            sources = cmp.config.sources({
                { name = "buffer" },
            }, {
                { name = "cmdline_history" },
            }),
        })
    end,
}
