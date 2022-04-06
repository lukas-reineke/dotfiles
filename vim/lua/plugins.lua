vim.g.loaded_netrwPlugin = false
vim.cmd [[packadd cfilter]]

require("packer").startup {
    function()
        use "wbthomason/packer.nvim"

        use "neovim/nvim-lspconfig"
        use "ray-x/lsp_signature.nvim"
        use "jose-elias-alvarez/nvim-lsp-ts-utils"

        use { "edluffy/hologram.nvim" }

        use {
            "stevearc/dressing.nvim",
            config = function()
                require("dressing").setup {
                    select = {
                        backend = { "fzf_lua", "fzf" },
                    },
                }
            end,
        }

        use {
            "~/dev/neo-tree.nvim",
            branch = "v2.x",
            requires = {
                "nvim-lua/plenary.nvim",
                "kyazdani42/nvim-web-devicons",
                "MunifTanjim/nui.nvim",
            },
            after = { "nvim-web-devicons" },
            config = function()
                vim.g.neo_tree_remove_legacy_commands = true
                require("neo-tree.sources.common.components").diagnostics = function(config, node, state)
                    local diag = state.diagnostics_lookup or {}
                    local diag_state = diag[node:get_id()]
                    if not diag_state then
                        return {}
                    end
                    return {
                        text = ({
                            Error = " ",
                            Warn = " ",
                            Info = " ",
                            Hint = " ",
                        })[diag_state.severity_string],
                        highlight = "Diagnostic" .. diag_state.severity_string,
                    }
                end

                require("neo-tree").setup {
                    close_if_last_window = true,
                    default_component_configs = {
                        indent = {
                            indent_size = 4,
                            last_indent_marker = "└──",
                        },
                        name = {
                            trailing_slash = true,
                        },
                        git_status = {
                            symbols = {
                                -- Change type
                                added = "✚",
                                deleted = "✖",
                                modified = "",
                                renamed = "",
                                -- Status type
                                untracked = "",
                                ignored = "",
                                unstaged = "",
                                staged = "",
                                conflict = "",
                            },
                        },
                    },
                    window = {
                        position = "current",
                        mappings = {
                            ["o"] = "open",
                            ["m"] = "cut_to_clipboard",
                            ["p"] = "paste_from_clipboard",
                            ["q"] = "close_window",
                            ["<ESC>"] = "close_window",
                        },
                    },
                    nesting_rules = {},
                    filesystem = {
                        filtered_items = {
                            visible = true,
                            hide_dotfiles = false,
                            hide_gitignored = true,
                        },
                        follow_current_file = true,
                        hijack_netrw_behavior = "open_current",
                        use_libuv_file_watcher = true,
                        renderers = {
                            directory = {
                                { "indent" },
                                { "icon" },
                                { "current_filter" },
                                { "name" },
                                { "clipboard" },
                                { "diagnostics" },
                            },
                            file = {
                                { "indent" },
                                { "icon" },
                                { "name" },
                                { "clipboard" },
                                { "diagnostics" },
                                { "git_status" },
                            },
                        },
                    },
                    git_status = {
                        window = {
                            position = "float",
                        },
                    },
                }
            end,
        }

        use {
            "hrsh7th/nvim-cmp",
            requires = {
                { "andersevenrud/compe-tmux", branch = "cmp" },
                { "hrsh7th/cmp-buffer" },
                { "hrsh7th/cmp-path" },
                { "hrsh7th/cmp-nvim-lua" },
                { "hrsh7th/cmp-nvim-lsp" },
                { "saadparwaiz1/cmp_luasnip" },
                { "hrsh7th/cmp-cmdline" },
                { "~/dev/cmp-under-comparator" },
                { "~/dev/cmp-rg" },
                { "octaltree/cmp-look" },
            },
            config = function()
                local cmp = require "cmp"
                local cmp_compare = require "cmp_compare"
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
                            }
                            vim_item.menu = menu_map[entry.source.name] or string.format("[%s]", entry.source.name)

                            vim_item.kind = vim.lsp.protocol.CompletionItemKind[vim_item.kind]
                            return vim_item
                        end,
                    },

                    documentation = {
                        border = vim.g.floating_window_border_dark,
                    },

                    experimental = {
                        native_menu = false,
                        ghost_text = true,
                    },
                }
                cmp.setup.cmdline(":", {
                    sources = {
                        { name = "cmdline" },
                    },
                })
            end,
        }
        use {
            "L3MON4D3/LuaSnip",
            config = function()
                require("luasnip").config.set_config {
                    enable_autosnippets = true,
                }
            end,
        }

        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = function()
                local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
                parser_config.org = {
                    install_info = {
                        url = "/home/lukas/dev/tree-sitter-org",
                        revision = "main",
                        files = { "src/parser.c", "src/scanner.cc" },
                    },
                    filetype = "org",
                }

                require("nvim-treesitter.configs").setup {
                    ensure_installed = "all",
                    highlight = {
                        enable = true,
                        language_tree = true,
                        additional_vim_regex_highlighting = { "org" },
                    },
                    indent = {
                        enable = true,
                    },
                    refactor = {
                        highlight_definitions = {
                            enable = true,
                        },
                    },
                    autotag = {
                        enable = true,
                    },
                    context_commentstring = {
                        enable = true,
                    },
                    textobjects = {
                        select = {
                            enable = true,
                            keymaps = {
                                ["af"] = "@function.outer",
                                ["if"] = "@function.inner",
                                ["ac"] = "@comment.outer",
                                ["ic"] = "@comment.inner",
                            },
                        },
                    },
                    textsubjects = {
                        enable = true,
                        keymaps = {
                            ["<CR>"] = "textsubjects-smart",
                            [";"] = "textsubjects-container-outer",
                        },
                    },
                }
            end,
        }
        use "nvim-treesitter/playground"
        use "nvim-treesitter/nvim-treesitter-refactor"
        use "nvim-treesitter/nvim-treesitter-textobjects"
        use "RRethy/nvim-treesitter-textsubjects"
        use "JoosepAlviste/nvim-ts-context-commentstring"
        use "David-Kunz/treesitter-unit"
        use "windwp/nvim-ts-autotag"
        use "spywhere/detect-language.nvim"

        use {
            "~/dev/lsp-format.nvim",
            config = function()
                local prettier = {
                    tabWidth = 4,
                    singleQuote = true,
                    trailingComma = "all",
                    configPrecedence = "prefer-file",
                }
                require("lsp-format").setup {
                    typescript = prettier,
                    javascript = prettier,
                    typescriptreact = prettier,
                    javascriptreact = prettier,
                    json = prettier,
                    css = prettier,
                    scss = prettier,
                    html = prettier,
                    yaml = {
                        tabWidth = 2,
                        singleQuote = true,
                        trailingComma = "all",
                        configPrecedence = "prefer-file",
                    },
                    markdown = prettier,
                    sh = {
                        tabWidth = 4,
                    },
                }
            end,
        }

        use {
            "~/dev/orgmode.nvim",
            config = function()
                local onedark = require "onedark"
                require("orgmode").setup {
                    org_default_notes_file = "~/dev/org/notes.org",
                    org_agenda_templates = {
                        f = {
                            description = "File notes",
                            template = "* TODO %?\n  %u\n  %a",
                            target = "~/dev/org/notes.org",
                        },
                    },
                    org_todo_keywords = { "TODO(t)", "|", "DONE", "CANCELED" },
                    org_todo_keyword_faces = {
                        TODO = ":foreground " .. onedark.colors.purple .. " :weight bold",
                        DONE = ":foreground " .. onedark.colors.green .. " :weight bold",
                        CANCELED = ":foreground " .. onedark.colors.red .. " :weight bold",
                    },
                    org_hide_emphasis_markers = true,
                    mappings = {
                        disable_all = true,
                    },
                }
            end,
        }
        use "overcache/NeoSolarized"
        use {
            "akinsho/org-bullets.nvim",
            config = function()
                require("org-bullets").setup {}
            end,
        }

        use {
            "dhruvasagar/vim-table-mode",
            config = function()
                vim.g.table_mode_verbose = false
            end,
        }

        use {
            "~/dev/onedark.nvim",
            config = function()
                require("onedark").setup {}
            end,
        }
        use {
            "~/dev/headlines.nvim",
            config = function()
                require("headlines").setup {
                    markdown = {
                        headline_highlights = {
                            "HeadlineGreen",
                            "HeadlineBlue",
                            "HeadlineRed",
                            "HeadlinePurple",
                            "HeadlineYellow",
                        },
                    },
                    vimwiki = {
                        headline_highlights = { "HeadlineGreen", "HeadlineYellow", "HeadlineBlue" },
                    },
                    org = {
                        headline_highlights = {
                            "HeadlineGreen",
                            "HeadlineBlue",
                            "HeadlineRed",
                            "HeadlinePurple",
                            "HeadlineYellow",
                        },
                    },
                    git = {
                        headline_pattern = "^@@",
                        headline_highlights = { "HeadlinePurple" },
                    },
                }
            end,
        }
        use {
            "~/dev/virt-column.nvim",
            config = function()
                require("virt-column").setup { virtcolumn = "+1" }
            end,
        }
        use {
            "~/dev/indent-blankline.nvim",
            config = function()
                require("indent_blankline").setup {
                    filetype_exclude = {
                        "vimwiki",
                        "man",
                        "gitmessengerpopup",
                        "diagnosticpopup",
                        "lspinfo",
                        "packer",
                        "checkhealth",
                        "TelescopePrompt",
                        "TelescopeResults",
                        "",
                    },
                    buftype_exclude = { "terminal" },
                    space_char_blankline = " ",
                    show_foldtext = false,
                    strict_tabs = true,
                    debug = true,
                    disable_with_nolist = true,
                    max_indent_increase = 1,
                    show_current_context = true,
                    show_current_context_start = true,
                }
            end,
        }

        use {
            "junegunn/fzf.vim",
            requires = {
                { "junegunn/fzf" },
            },
            config = function()
                vim.g.fzf_buffers_jump = true
                vim.g.fzf_layout = { window = { width = 0.8, height = 0.4, yoffset = 0.2 } }
                vim.cmd [[let $FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS . ' --reverse --ansi']]
            end,
        }
        use "vijaymarupudi/nvim-fzf"

        use {
            "kyazdani42/nvim-web-devicons",
            config = function()
                require("nvim-web-devicons").setup {
                    default = true,
                }
            end,
        }

        use "tpope/vim-fugitive"
        use "tpope/vim-rhubarb"
        use "tpope/vim-repeat"
        use "tpope/vim-eunuch"
        use "tpope/vim-obsession"
        use "tpope/vim-sleuth"

        use {
            "numToStr/Comment.nvim",
            config = function()
                require("Comment").setup()
            end,
        }

        use {
            "rmagatti/auto-session",
            config = function()
                require("auto-session").setup {
                    log_level = "error",
                }
            end,
        }

        use "krisajenkins/vim-projectlocal"

        use {
            "airblade/vim-gitgutter",
            config = function()
                vim.g.gitgutter_map_keys = false
                vim.g.gitgutter_sign_added = "│"
                vim.g.gitgutter_sign_modified = "│"
                vim.g.gitgutter_sign_removed = "│"
                vim.g.gitgutter_sign_removed_first_line = "│"
                vim.g.gitgutter_sign_removed_above_and_below = "│"
                vim.g.gitgutter_sign_modified_removed = "│"
            end,
        }

        use {
            "pwntester/octo.nvim",
            requires = {
                { "nvim-lua/plenary.nvim" },
                { "nvim-lua/popup.nvim" },
                { "nvim-telescope/telescope.nvim" },
            },
            config = function()
                require("octo").setup()
            end,
        }
        use {
            "rhysd/git-messenger.vim",
            config = function()
                vim.g.git_messenger_floating_win_opts = { border = vim.g.floating_window_border_dark }
            end,
        }

        use {
            "numToStr/Navigator.nvim",
            config = function()
                require("Navigator").setup()
            end,
        }

        use {
            "SirVer/ultisnips",
            config = function()
                vim.g.UltiSnipsSnippetsDir = "~/dotfiles/vim/ultisnips"
                vim.g.UltiSnipsSnippetDirectories = { "ultisnips" }
                vim.g.UltiSnipsExpandTrigger = "<joifjioejfio>"
            end,
        }

        use {
            "cohama/lexima.vim",
            config = function()
                vim.g.lexima_no_default_rules = true
                vim.fn["lexima#set_default_rules"]()
                vim.g.completion_confirm_key = ""
            end,
        }

        use "michaeljsmith/vim-indent-object"
        use "wellle/targets.vim"

        use {
            "rrethy/vim-hexokinase",
            run = "make hexokinase",
            config = function()
                vim.g.Hexokinase_optInPatterns = "full_hex,rgb,rgba,hsl,hsla"
            end,
        }

        use "vim-scripts/UnconditionalPaste"

        use {
            "haya14busa/incsearch.vim",
            config = function()
                vim.g["incsearch#auto_nohlsearch"] = true
                vim.g["incsearch#magic"] = "\\v"
                vim.g["incsearch#consistent_n_direction"] = true
                vim.g["incsearch#do_not_save_error_message_history"] = true
            end,
        }
        use "vim-scripts/CmdlineComplete"

        use {
            "mileszs/ack.vim",
            config = function()
                vim.g.ackprg = "rg --vimgrep --no-heading --hidden --smart-case"
            end,
        }

        use {
            "romainl/vim-qf",
            config = function()
                vim.g.qf_nowrap = false
                vim.g.qf_max_height = 20
            end,
        }
        use {
            "kevinhwang91/nvim-bqf",
            config = function()
                require("bqf").setup {
                    preview = {
                        delay_syntax = 0,
                    },
                }
            end,
        }
        use {
            "https://gitlab.com/yorickpeterse/nvim-pqf.git",
            config = function()
                require("pqf").setup {
                    signs = {
                        error = "",
                        warning = "",
                        info = "",
                        hint = "",
                    },
                }
            end,
        }

        use "machakann/vim-sandwich"

        use "bounceme/poppy.vim"

        use {
            "vimwiki/vimwiki",
            branch = "dev",
            requires = { { "inkarkat/vim-SyntaxRange" } },
            config = function()
                vim.g.vimwiki_list = {
                    {
                        path = "~/vimwiki/",
                        auto_tags = 1,
                        auto_generate_links = 1,
                        auto_generate_tags = 1,
                        links_space_char = "-",
                    },
                }
                vim.g.vimwiki_folding = "custom"
                vim.g.vimwiki_use_calendar = 0
                vim.g.vimwiki_global_ext = 0
                vim.g.vimwiki_valid_html_tags = "b,i,s,u,sub,sup,kbd,br,hr,span"

                vim.g.vimwiki_key_mappings = {
                    all_maps = 1,
                    global = 0,
                    headers = 0,
                    text_objs = 1,
                    table_format = 0,
                    table_mappings = 1,
                    lists = 1,
                    links = 0,
                    html = 0,
                    mouse = 1,
                }
            end,
        }

        use "bkad/camelcasemotion"

        use "vim-scripts/ReplaceWithRegister"
        use "vim-scripts/ReplaceWithSameIndentRegister"

        use "arthurxavierx/vim-caser"

        use "z1mm32m4n/vim-superman"

        use {
            "rhysd/clever-f.vim",
            config = function()
                vim.g.clever_f_use_migemo = true
            end,
        }
        use "kepbod/quick-scope"
        use "ggandor/lightspeed.nvim"

        use {
            "AndrewRadev/splitjoin.vim",
            config = function()
                vim.g.conjoin_map_J = "gJ"
                vim.g.conjoin_map_gJ = "<con-nope>"
            end,
        }

        use {
            "kshenoy/vim-signature",
            config = function()
                vim.g.SignatureForceRemoveGlobal = true
            end,
        }

        use "kana/vim-niceblock"

        use {
            "tyru/open-browser.vim",
            config = function()
                vim.g.openbrowser_default_search = "duckduckgo"
            end,
        }

        use "famiu/feline.nvim"

        use "jparise/vim-graphql"

        use "milisims/nvim-luaref"

        use {
            "karb94/neoscroll.nvim",
            config = function()
                require("neoscroll").setup {}
                require("neoscroll.config").set_mappings {
                    ["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "49" } },
                    ["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "50" } },
                    ["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "150" } },
                    ["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "150" } },
                    ["<C-y>"] = { "scroll", { "-0.10", "false", "20" } },
                    ["<C-e>"] = { "scroll", { "0.10", "false", "20" } },
                    ["zt"] = { "zt", { "50" } },
                    ["zz"] = { "zz", { "50" } },
                    ["zb"] = { "zb", { "50" } },
                }
            end,
        }
    end,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float { border = vim.g.floating_window_border }
            end,
        },
    },
}
