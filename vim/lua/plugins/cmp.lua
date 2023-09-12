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
        "octaltree/cmp-look",
        "rcarriga/cmp-dap",
        "petertriho/cmp-git",
        "lttr/cmp-jira",
    },
    event = { "InsertEnter", "CmdlineEnter" },
    config = function()
        local cmp = require "cmp"
        local cmp_compare = require "cmp_compare"
        local dev_icons = require "nvim-web-devicons"
        require("cmp_git").setup()
        require("cmp_jira").setup()

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
                    if cmp.visible() then
                        return cmp.mapping.confirm {
                            behavior = cmp.ConfirmBehavior.Insert,
                            select = true,
                        }(fallback)
                    else
                        return fallback()
                    end
                end,
                ["<C-n>"] = function(fallback)
                    if cmp.visible() then
                        return cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }(fallback)
                    else
                        return cmp.mapping.complete { reason = cmp.ContextReason.Auto }(fallback)
                    end
                end,
                ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
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
                    cmp_compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                },
            },

            sources = {
                { name = "path", priority_weight = 110 },
                { name = "cmp_jira", priority_weight = 110 },
                { name = "orgmode", priority_weight = 110 },
                { name = "crates", priority_weight = 110 },
                { name = "dap", priority_weight = 110 },
                { name = "git", priority_weight = 110 },
                { name = "nvim_lsp", max_item_count = 20, priority_weight = 100 },
                { name = "nvim_lua", priority_weight = 90 },
                { name = "luasnip", priority_weight = 80 },
                { name = "buffer", max_item_count = 5, priority_weight = 70 },
                {
                    name = "rg",
                    keyword_length = 5,
                    max_item_count = 5,
                    priority_weight = 60,
                    option = {
                        additional_arguments = "--smart-case --hidden",
                    },
                },
                { name = "tmux", max_item_count = 5, option = { all_panes = false }, priority_weight = 50 },
                {
                    name = "look",
                    keyword_length = 5,
                    max_item_count = 5,
                    option = { convert_case = true, loud = true },
                    priority_weight = 40,
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
